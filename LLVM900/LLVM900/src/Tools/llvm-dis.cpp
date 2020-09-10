//===-- llvm-dis.cpp - The low-level LLVM disassembler --------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This utility may be invoked in the following manner:
//  llvm-dis [options]      - Read LLVM bitcode from stdin, write asm to stdout
//  llvm-dis [options] x.bc - Read LLVM bitcode from the x.bc file, write asm
//                            to the x.ll file.
//  Options:
//      --help   - Output information about command line switches
//
//===----------------------------------------------------------------------===//

#include "llvm/Bitcode/BitcodeReader.h"
#include "llvm/IR/AssemblyAnnotationWriter.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/DiagnosticInfo.h"
#include "llvm/IR/DiagnosticPrinter.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Type.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Error.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Support/InitLLVM.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/ToolOutputFile.h"
#include "llvm/Support/WithColor.h"
#include <system_error>
using namespace llvm;
typedef void проц;
typedef void* ук;

typedef bool бул;

typedef  signed char байт;   ///int8_t
typedef  unsigned char ббайт;  ///uint8_t

typedef  short крат;  ///int16_t
typedef  unsigned short бкрат; ///uint16_t

typedef  int цел;  ///int32_t
typedef  unsigned int бцел; ///uint32_t

typedef  long long дол;   ///int64_t
typedef  unsigned long long бдол;  ///uint64_t

typedef  size_t т_мера;

typedef const char* ткст0;

static cl::opt<std::string>
ВхИмяФ(cl::Positional, cl::desc("<вводный биткод>"), cl::init("-"));

static cl::opt<std::string>
ВыхИмяФ("o", cl::desc("Переписать выходное имя файла"),
               cl::value_desc("filename"));

static cl::opt<bool>
Force("f", cl::desc("Активировать двоичный вывод на терминалы"));

static cl::opt<bool>
DontPrint("disable-output", cl::desc("Не выводить файл .ll"), cl::Hidden);

static cl::opt<bool>
    SetImporting("set-importing",
                 cl::desc("Установить левиную загрузку, имитирующую загрузку модуля"),
                 cl::Hidden);

static cl::opt<bool>
    ShowAnnotations("show-annotations",
                    cl::desc("Добавить в файл .ll информационные коммментарии"));

static cl::opt<bool> PreserveAssemblyUseListOrder(
    "preserve-ll-uselistorder",
    cl::desc("Сохранять порядок use-list при записи сборки LLVM."),
    cl::init(false), cl::Hidden);

static cl::opt<bool>
    MaterializeMetadata("materialize-metadata",
                        cl::desc("Загрузить модуль без материализации метаданных, "
                                 "затем материализовать только метаданные"));

namespace {

static void printDebugLoc(const DebugLoc &DL, formatted_raw_ostream &OS) {
  OS << DL.getLine() << ":" << DL.getCol();
  if (DILocation *IDL = DL.getInlinedAt()) {
    OS << "@";
    printDebugLoc(IDL, OS);
  }
}
class CommentWriter : public AssemblyAnnotationWriter {
public:
  void emitFunctionAnnot(const Function *F,
                         formatted_raw_ostream &OS) override {
    OS << "; [#uses=" << F->getNumUses() << ']';  // Output # uses
    OS << '\n';
  }
  void printInfoComment(const Value &V, formatted_raw_ostream &OS) override {
    bool Padded = false;
    if (!V.getType()->isVoidTy()) {
      OS.PadToColumn(50);
      Padded = true;
      // Output # uses and type
      OS << "; [#uses=" << V.getNumUses() << " type=" << *V.getType() << "]";
    }
    if (const Instruction *I = dyn_cast<Instruction>(&V)) {
      if (const DebugLoc &DL = I->getDebugLoc()) {
        if (!Padded) {
          OS.PadToColumn(50);
          Padded = true;
          OS << ";";
        }
        OS << " [debug line = ";
        printDebugLoc(DL,OS);
        OS << "]";
      }
      if (const DbgDeclareInst *DDI = dyn_cast<DbgDeclareInst>(I)) {
        if (!Padded) {
          OS.PadToColumn(50);
          OS << ";";
        }
        OS << " [debug variable = " << DDI->getVariable()->getName() << "]";
      }
      else if (const DbgValueInst *DVI = dyn_cast<DbgValueInst>(I)) {
        if (!Padded) {
          OS.PadToColumn(50);
          OS << ";";
        }
        OS << " [debug variable = " << DVI->getVariable()->getName() << "]";
      }
    }
  }
};

struct LLVMDisDiagnosticHandler : public DiagnosticHandler {
  char *Prefix;
  LLVMDisDiagnosticHandler(char *PrefixPtr) : Prefix(PrefixPtr) {}
  bool handleDiagnostics(const DiagnosticInfo &DI) override {
    raw_ostream &OS = errs();
    OS << Prefix << ": ";
    switch (DI.getSeverity()) {
      case DS_Error: WithColor::error(OS); break;
      case DS_Warning: WithColor::warning(OS); break;
      case DS_Remark: OS << "remark: "; break;
      case DS_Note: WithColor::note(OS); break;
    }

    DiagnosticPrinterRawOStream DP(OS);
    DI.print(DP);
    OS << '\n';

    if (DI.getSeverity() == DS_Error)
      exit(1);
    return true;
  }
};
} // end anon namespace

static ExitOnError ExitOnErr;

extern "C" __declspec(dllexport) цел ЛЛВхоФункцЛЛДиз(цел argc, char **argv) {
  InitLLVM X(argc, argv);

  ExitOnErr.setBanner(std::string(argv[0]) + ": : ");

  LLVMContext Context;
  Context.setDiagnosticHandler(
      llvm::make_unique<LLVMDisDiagnosticHandler>(argv[0]));
  cl::ParseCommandLineOptions(argc, argv, "llvm .bc -> .ll disassembler\n");

  std::unique_ptr<MemoryBuffer> MB =
      ExitOnErr(errorOrToExpected(MemoryBuffer::getFileOrSTDIN(ВхИмяФ)));
  std::unique_ptr<Module> M = ExitOnErr(getLazyBitcodeModule(
      *MB, Context, /*ShouldLazyLoadMetadata=*/true, SetImporting));
  if (MaterializeMetadata)
    ExitOnErr(M->materializeMetadata());
  else
    ExitOnErr(M->materializeAll());

  BitcodeLTOInfo LTOInfo = ExitOnErr(getBitcodeLTOInfo(*MB));
  std::unique_ptr<ModuleSummaryIndex> Index;
  if (LTOInfo.HasSummary)
    Index = ExitOnErr(getModuleSummaryIndex(*MB));

  // Just use stdout.  We won't actually print anything on it.
  if (DontPrint)
    ВыхИмяФ = "-";

  if (ВыхИмяФ.empty()) { // Unspecified output, infer it.
    if (ВхИмяФ == "-") {
      ВыхИмяФ = "-";
    } else {
      StringRef IFN = ВхИмяФ;
      ВыхИмяФ = (IFN.endswith(".bc") ? IFN.drop_back(3) : IFN).str();
      ВыхИмяФ += ".ll";
    }
  }

  std::error_code EC;
  std::unique_ptr<ToolOutputFile> Out(
      new ToolOutputFile(ВыхИмяФ, EC, sys::fs::F_None));
  if (EC) {
    errs() << EC.message() << '\n';
    return 1;
  }

  std::unique_ptr<AssemblyAnnotationWriter> Annotator;
  if (ShowAnnotations)
    Annotator.reset(new CommentWriter());

  // All that llvm-dis does is write the assembly to a file.
  if (!DontPrint) {
    M->print(Out->os(), Annotator.get(), PreserveAssemblyUseListOrder);
    if (Index)
      Index->print(Out->os());
  }

  // Declare success.
  Out->keep();

  return 0;
}
