﻿extern "C" {
#include "Header.h"


/**
 * The current debug metadata version number.
 */
LLEXPORT unsigned ЛЛВерсияОтладМетадан(void) {
    return LLVMDebugMetadataVersion();
}

/**
 * The version of debug metadata that's present in the provided \c Module.
 */
LLEXPORT unsigned ЛЛДайВерсиюМодуляОтладМетадан(ЛЛМодуль Module) {
    return LLVMGetModuleDebugMetadataVersion(Module);
}

/**
 * Strip debug info in the module if it exists.
 * To do this, we remove all calls to the debugger intrinsics and any named
 * metadata for debugging. We also remove debug locations for instructions.
 * Return true if module is modified.
 */

LLEXPORT ЛЛБул ЛЛУдалиОтладИнфоВМодуле(ЛЛМодуль Module) {
    return LLVMStripModuleDebugInfo( Module);
  }

/**
 * Construct a builder for a module, and do not allow for unresolved nodes
 * attached to the module.
 */
LLEXPORT ЛЛПостроительОИ ЛЛСоздайПостроительОИЗапрНеразр(ЛЛМодуль M) {
    return LLVMCreateDIBuilderDisallowUnresolved(M);
}

/**
 * Construct a builder for a module and collect unresolved nodes attached
 * to the module in order to resolve cycles during a call to
 * \c LLVMDIBuilderFinalize.
 */
LLEXPORT ЛЛПостроительОИ ЛЛСоздайПостроительОИ(ЛЛМодуль M) {
    return LLVMCreateDIBuilder(M);
}

/**
 * Deallocates the \c DIBuilder and everything it owns.
 * @note You must call \c LLVMDIBuilderFinalize before this
 */
LLEXPORT void ЛЛВыместиПостроительОИ(ЛЛПостроительОИ Builder) {
    return LLVMDisposeDIBuilder(Builder);
}

/**
 * Construct any deferred debug info descriptors.
 */
LLEXPORT void ЛЛПостроительОИ_Финализуй(ЛЛПостроительОИ Builder) {
    return LLVMDIBuilderFinalize(Builder);
}

/**
 * A CompileUnit provides an anchor for all debugging
 * information generated during this instance of compilation.
 * \param Lang          Source programming language, eg.
 *                      \c LLVMDWARFSourceLanguageC99
 * \param FileRef       File info.
 * \param Producer      Identify the producer of debugging information
 *                      and code.  Usually this is a compiler
 *                      version string.
 * \param ProducerLen   The length of the C string passed to \c Producer.
 * \param isOptimized   A boolean flag which indicates whether optimization
 *                      is enabled or not.
 * \param Flags         This string lists command line options. This
 *                      string is directly embedded in debug info
 *                      output which may be used by a tool
 *                      analyzing generated debugging information.
 * \param FlagsLen      The length of the C string passed to \c Flags.
 * \param RuntimeVer    This indicates runtime version for languages like
 *                      Objective-C.
 * \param SplitName     The name of the file that we'll split debug info
 *                      out into.
 * \param SplitNameLen  The length of the C string passed to \c SplitName.
 * \param Kind          The kind of debug information to generate.
 * \param DWOId         The DWOId if this is a split skeleton compile unit.
 * \param SplitDebugInlining    Whether to emit inline debug info.
 * \param DebugInfoForProfiling Whether to emit extra debug info for
 *                              profile collection.
 */
LLEXPORT ЛЛМетаданные ЛЛПостроительОИ_СоздайЕдиницуКомпиляции(
    ЛЛПостроительОИ Builder, LLVMDWARFSourceLanguage Lang,
    ЛЛМетаданные FileRef, const char *Producer, size_t ProducerLen,
    ЛЛБул isOptimized, const char *Flags, size_t FlagsLen,
    unsigned RuntimeVer, const char *SplitName, size_t SplitNameLen,
    LLVMDWARFEmissionKind Kind, unsigned DWOId, ЛЛБул SplitDebugInlining,
    ЛЛБул DebugInfoForProfiling) {
    return  LLVMDIBuilderCreateCompileUnit( Builder,  Lang, FileRef, Producer,  ProducerLen,
     isOptimized, Flags,  FlagsLen,  RuntimeVer, SplitName,  SplitNameLen,
     Kind,  DWOId,  SplitDebugInlining, DebugInfoForProfiling);
}

/**
 * Create a file descriptor to hold debugging information for a file.
 * \param Builder      The \c DIBuilder.
 * \param Filename     File name.
 * \param FilenameLen  The length of the C string passed to \c Filename.
 * \param Directory    Directory.
 * \param DirectoryLen The length of the C string passed to \c Directory.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайФайл(ЛЛПостроительОИ Builder, const char *Filename,
                        size_t FilenameLen, const char *Directory,
                        size_t DirectoryLen) {
    return LLVMDIBuilderCreateFile( Builder, Filename, FilenameLen, 
      Directory,DirectoryLen);
}

/**
 * Creates a new descriptor for a module with the specified parent scope.
 * \param Builder         The \c DIBuilder.
 * \param ParentScope     The parent scope containing this module declaration.
 * \param Name            Module name.
 * \param NameLen         The length of the C string passed to \c Name.
 * \param ConfigMacros    A space-separated shell-quoted list of -D macro
                          definitions as they would appear on a command line.
 * \param ConfigMacrosLen The length of the C string passed to \c ConfigMacros.
 * \param IncludePath     The path to the module map file.
 * \param IncludePathLen  The length of the C string passed to \c IncludePath.
 * \param ISysRoot        The Clang system root (value of -isysroot).
 * \param ISysRootLen     The length of the C string passed to \c ISysRoot.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайМодуль(ЛЛПостроительОИ Builder, ЛЛМетаданные ParentScope,
                          const char *Name, size_t NameLen,
                          const char *ConfigMacros, size_t ConfigMacrosLen,
                          const char *IncludePath, size_t IncludePathLen,
                          const char *ISysRoot, size_t ISysRootLen) {
    return LLVMDIBuilderCreateModule( Builder,  ParentScope,
                          Name,  NameLen, ConfigMacros,  ConfigMacrosLen,
                          IncludePath,  IncludePathLen, ISysRoot,  ISysRootLen);
}

/**
 * Creates a new descriptor for a namespace with the specified parent scope.
 * \param Builder          The \c DIBuilder.
 * \param ParentScope      The parent scope containing this module declaration.
 * \param Name             NameSpace name.
 * \param NameLen          The length of the C string passed to \c Name.
 * \param ExportSymbols    Whether or not the namespace exports symbols, e.g.
 *                         this is true of C++ inline namespaces.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайПрострвоИмён(ЛЛПостроительОИ Builder,
                             ЛЛМетаданные ParentScope,
                             const char *Name, size_t NameLen,
                             ЛЛБул ExportSymbols) {
    return LLVMDIBuilderCreateNameSpace( Builder, ParentScope,
                             Name,  NameLen, ExportSymbols);
}

/**
 * Create a new descriptor for the specified subprogram.
 * \param Builder         The \c DIBuilder.
 * \param Scope           Function scope.
 * \param Name            Function name.
 * \param NameLen         Length of enumeration name.
 * \param LinkageName     Mangled function name.
 * \param LinkageNameLen  Length of linkage name.
 * \param File            File where this variable is defined.
 * \param LineNo          Line number.
 * \param Ty              Function type.
 * \param IsLocalToUnit   True if this function is not externally visible.
 * \param IsDefinition    True if this is a function definition.
 * \param ScopeLine       Set to the beginning of the scope this starts
 * \param Flags           E.g.: \c LLVMDIFlagLValueReference. These flags are
 *                        used to emit dwarf attributes.
 * \param IsOptimized     True if optimization is ON.
 */
LLEXPORT ЛЛМетаданные ЛЛПостроительОИ_СоздайФункц(
    ЛЛПостроительОИ Builder, ЛЛМетаданные Scope, const char *Name,
    size_t NameLen, const char *LinkageName, size_t LinkageNameLen,
    ЛЛМетаданные File, unsigned LineNo, ЛЛМетаданные Ty,
    ЛЛБул IsLocalToUnit, ЛЛБул IsDefinition,
    unsigned ScopeLine, LLVMDIFlags Flags, ЛЛБул IsOptimized) {
    return LLVMDIBuilderCreateFunction( Builder,  Scope, Name,
     NameLen, LinkageName,  LinkageNameLen, File,  LineNo,  Ty,
     IsLocalToUnit,  IsDefinition, ScopeLine,  Flags,  IsOptimized);
}

/**
 * Create a descriptor for a lexical block with the specified parent context.
 * \param Builder      The \c DIBuilder.
 * \param Scope        Parent lexical block.
 * \param File         Source file.
 * \param Line         The line in the source file.
 * \param Column       The column in the source file.
 */
LLEXPORT ЛЛМетаданные ЛЛПостроительОИ_СоздайЛексичБлок(
    ЛЛПостроительОИ Builder, ЛЛМетаданные Scope,
    ЛЛМетаданные File, unsigned Line, unsigned Column) {
    return LLVMDIBuilderCreateLexicalBlock( Builder,  Scope, File,  Line,  Column);
}
/**
 * Create a descriptor for a lexical block with a new file attached.
 * \param Builder        The \c DIBuilder.
 * \param Scope          Lexical block.
 * \param File           Source file.
 * \param Discriminator  DWARF path discriminator value.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайФайлЛексичБлока(ЛЛПостроительОИ Builder,
                                    ЛЛМетаданные Scope,
                                    ЛЛМетаданные File,
                                    unsigned Discriminator) {
    return LLVMDIBuilderCreateLexicalBlockFile( Builder,  Scope,
                                     File, Discriminator) ;
}

/**
 * Create a descriptor for an imported namespace. Suitable for e.g. C++
 * using declarations.
 * \param Builder    The \c DIBuilder.
 * \param Scope      The scope this module is imported into
 * \param File       File where the declaration is located.
 * \param Line       Line number of the declaration.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайИмпортирМодульИзПрострваИмён(ЛЛПостроительОИ Builder,
                                               ЛЛМетаданные Scope,
                                               ЛЛМетаданные NS,
                                               ЛЛМетаданные File,
                                               unsigned Line) {
    return LLVMDIBuilderCreateImportedModuleFromNamespace( Builder,
                                                Scope, NS,  File, Line);
}

/**
 * Create a descriptor for an imported module that aliases another
 * imported entity descriptor.
 * \param Builder        The \c DIBuilder.
 * \param Scope          The scope this module is imported into
 * \param ImportedEntity Previous imported entity to alias.
 * \param File           File where the declaration is located.
 * \param Line           Line number of the declaration.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайИмпортирМодульИзАлиаса(ЛЛПостроительОИ Builder,
                                           ЛЛМетаданные Scope,
                                           ЛЛМетаданные ImportedEntity,
                                           ЛЛМетаданные File,
                                           unsigned Line) {
    return LLVMDIBuilderCreateImportedModuleFromAlias( Builder, Scope,
                                            ImportedEntity, File, Line);
}

/**
 * Create a descriptor for an imported module.
 * \param Builder    The \c DIBuilder.
 * \param Scope      The scope this module is imported into
 * \param M          The module being imported here
 * \param File       File where the declaration is located.
 * \param Line       Line number of the declaration.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайИмпортирМодульИзМодуля(ЛЛПостроительОИ Builder,
                                            ЛЛМетаданные Scope,
                                            ЛЛМетаданные M,
                                            ЛЛМетаданные File,
                                            unsigned Line) {
    return LLVMDIBuilderCreateImportedModuleFromModule( Builder,
                                             Scope, M, File, Line);
}

/**
 * Create a descriptor for an imported function, type, or variable.  Suitable
 * for e.g. FORTRAN-style USE declarations.
 * \param Builder    The DIBuilder.
 * \param Scope      The scope this module is imported into.
 * \param Decl       The declaration (or definition) of a function, type,
                     or variable.
 * \param File       File where the declaration is located.
 * \param Line       Line number of the declaration.
 * \param Name       A name that uniquely identifies this imported declaration.
 * \param NameLen    The length of the C string passed to \c Name.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайИмпортирДекларацию(ЛЛПостроительОИ Builder,
                                       ЛЛМетаданные Scope,
                                       ЛЛМетаданные Decl,
                                       ЛЛМетаданные File,
                                       unsigned Line,
                                       const char *Name, size_t NameLen) {
    return LLVMDIBuilderCreateImportedDeclaration( Builder,
                                        Scope,Decl,File,Line, Name, NameLen) ;
}

/**
 * Creates a new DebugLocation that describes a source location.
 * \param Line The line in the source file.
 * \param Column The column in the source file.
 * \param Scope The scope in which the location resides.
 * \param InlinedAt The scope where this location was inlined, if at all.
 *                  (optional).
 * \note If the item to which this location is attached cannot be
 *       attributed to a source line, pass 0 for the line and column.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайЛокациюОтладки(LLVMContextRef Ctx, unsigned Line,
                                 unsigned Column, ЛЛМетаданные Scope,
                                 ЛЛМетаданные InlinedAt) {
    return LLVMDIBuilderCreateDebugLocation( Ctx,  Line,
                                  Column,  Scope, InlinedAt);
}

/**
 * Get the line number of this debug location.
 * \param Location     The debug location.
 *
 * @see DILocation::getLine()
 */
LLEXPORT unsigned ЛЛЛокацОИ_ДайСтроку(ЛЛМетаданные Location) {
    return LLVMDILocationGetLine( Location) ;
}
/**
 * Get the column number of this debug location.
 * \param Location     The debug location.
 *
 * @see DILocation::getColumn()
 */
LLEXPORT unsigned ЛЛЛокацОИ_ДайСтолбец(ЛЛМетаданные Location) {
    return LLVMDILocationGetColumn( Location);
}

/**
 * Get the local scope associated with this debug location.
 * \param Location     The debug location.
 *
 * @see DILocation::getScope()
 */
LLEXPORT ЛЛМетаданные ЛЛЛокацОИ_ДайМасштаб(ЛЛМетаданные Location) {
    return  LLVMDILocationGetScope( Location) ;
}

/**
 * Get the "inline at" location associated with this debug location.
 * \param Location     The debug location.
 *
 * @see DILocation::getInlinedAt()
 */
LLEXPORT ЛЛМетаданные ЛЛЛокацОИ_ДайИнлайнУ(ЛЛМетаданные Location) {
    return LLVMDILocationGetInlinedAt( Location);
}

/**
 * Get the metadata of the file associated with a given scope.
 * \param Scope     The scope object.
 *
 * @see DIScope::getFile()
 */
LLEXPORT ЛЛМетаданные ЛЛМасштабОИ_ДайФайл(ЛЛМетаданные Scope) {
    return LLVMDIScopeGetFile(Scope) ;
}
/**
 * Get the directory of a given file.
 * \param File     The file object.
 * \param Len      The length of the returned string.
 *
 * @see DIFile::getDirectory()
 */
LLEXPORT const char *ЛЛФайлОИ_ДайПапку(ЛЛМетаданные File, unsigned *Len) {
    return LLVMDIFileGetDirectory( File, Len);
}

/**
 * Get the name of a given file.
 * \param File     The file object.
 * \param Len      The length of the returned string.
 *
 * @see DIFile::getFilename()
 */
LLEXPORT const char *ЛЛФайлОИ_ДайИмяФ(ЛЛМетаданные File, unsigned *Len) {
    return LLVMDIFileGetFilename( File, Len);
}
/**
 * Get the source of a given file.
 * \param File     The file object.
 * \param Len      The length of the returned string.
 *
 * @see DIFile::getSource()
 */
LLEXPORT const char *ЛЛФайлОИ_ДайИсходник(ЛЛМетаданные File, unsigned *Len) {
    return LLVMDIFileGetSource( File, Len);
}

/**
 * Create a type array.
 * \param Builder        The DIBuilder.
 * \param Data           The type elements.
 * \param NumElements    Number of type elements.
 */
LLEXPORT ЛЛМетаданные ЛЛПостроительОИ_ДайИлиСоздайМассивТипа(ЛЛПостроительОИ Builder,
                                                  ЛЛМетаданные *Data,
                                                  size_t NumElements) {
    return LLVMDIBuilderGetOrCreateTypeArray( Builder, Data, NumElements);
}

/**
 * Create subroutine type.
 * \param Builder        The DIBuilder.
 * \param File            The file in which the subroutine resides.
 * \param ParameterTypes  An array of subroutine parameter types. This
 *                        includes return type at 0th index.
 * \param NumParameterTypes The number of parameter types in \c ParameterTypes
 * \param Flags           E.g.: \c LLVMDIFlagLValueReference.
 *                        These flags are used to emit dwarf attributes.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайТипПодпроцедуры(ЛЛПостроительОИ Builder,
                                  ЛЛМетаданные File,
                                  ЛЛМетаданные *ParameterTypes,
                                  unsigned NumParameterTypes,
                                  LLVMDIFlags Flags) {
    return LLVMDIBuilderCreateSubroutineType( Builder,File,ParameterTypes,
                                   NumParameterTypes,Flags);
}

/**
 * Create debugging information entry for an enumerator.
 * @param Builder        The DIBuilder.
 * @param Name           Enumerator name.
 * @param NameLen        Length of enumerator name.
 * @param Value          Enumerator value.
 * @param IsUnsigned     True if the value is unsigned.
 */
LLEXPORT ЛЛМетаданные ЛЛПостроительОИ_СоздайПеречислитель(ЛЛПостроительОИ Builder,
                                              const char *Name, size_t NameLen,
                                              int64_t Value,
                                              ЛЛБул IsUnsigned) {
    return LLVMDIBuilderCreateEnumerator( Builder, Name,  NameLen, Value, IsUnsigned);
}

/**
 * Create debugging information entry for an enumeration.
 * \param Builder        The DIBuilder.
 * \param Scope          Scope in which this enumeration is defined.
 * \param Name           Enumeration name.
 * \param NameLen        Length of enumeration name.
 * \param File           File where this member is defined.
 * \param LineNumber     Line number.
 * \param SizeInBits     Member size.
 * \param AlignInBits    Member alignment.
 * \param Elements       Enumeration elements.
 * \param NumElements    Number of enumeration elements.
 * \param ClassTy        Underlying type of a C++11/ObjC fixed enum.
 */
LLEXPORT ЛЛМетаданные ЛЛПостроительОИ_СоздайТипПеречисления(
    ЛЛПостроительОИ Builder, ЛЛМетаданные Scope, const char *Name,
    size_t NameLen, ЛЛМетаданные File, unsigned LineNumber,
    uint64_t SizeInBits, uint32_t AlignInBits, ЛЛМетаданные *Elements,
    unsigned NumElements, ЛЛМетаданные ClassTy) 
{
    return LLVMDIBuilderCreateEnumerationType(
     Builder,  Scope, Name,NameLen,  File,  LineNumber,
     SizeInBits,  AlignInBits, Elements, NumElements,  ClassTy);
}

/**
 * Create debugging information entry for a union.
 * \param Builder      The DIBuilder.
 * \param Scope        Scope in which this union is defined.
 * \param Name         Union name.
 * \param NameLen      Length of union name.
 * \param File         File where this member is defined.
 * \param LineNumber   Line number.
 * \param SizeInBits   Member size.
 * \param AlignInBits  Member alignment.
 * \param Flags        Flags to encode member attribute, e.g. private
 * \param Elements     Union elements.
 * \param NumElements  Number of union elements.
 * \param RunTimeLang  Optional parameter, Objective-C runtime version.
 * \param UniqueId     A unique identifier for the union.
 * \param UniqueIdLen  Length of unique identifier.
 */
LLEXPORT ЛЛМетаданные ЛЛПостроительОИ_СоздайТипСоюз(
    ЛЛПостроительОИ Builder, ЛЛМетаданные Scope, const char *Name,
    size_t NameLen, ЛЛМетаданные File, unsigned LineNumber,
    uint64_t SizeInBits, uint32_t AlignInBits, LLVMDIFlags Flags,
    ЛЛМетаданные *Elements, unsigned NumElements, unsigned RunTimeLang,
    const char *UniqueId, size_t UniqueIdLen) 
{
    return LLVMDIBuilderCreateUnionType(Builder,  Scope, Name, NameLen,  File,  LineNumber,
     SizeInBits,  AlignInBits,  Flags, Elements,  NumElements,  RunTimeLang, UniqueId,  UniqueIdLen);
}


/**
 * Create debugging information entry for an array.
 * \param Builder      The DIBuilder.
 * \param Size         Array size.
 * \param AlignInBits  Alignment.
 * \param Ty           Element type.
 * \param Subscripts   Subscripts.
 * \param NumSubscripts Number of subscripts.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайТипМассив(ЛЛПостроительОИ Builder, uint64_t Size,
                             uint32_t AlignInBits, ЛЛМетаданные Ty,
                             ЛЛМетаданные *Subscripts,
                             unsigned NumSubscripts) {
    return LLVMDIBuilderCreateArrayType( Builder, Size, AlignInBits,  Ty,
                             Subscripts,NumSubscripts);
}

/**
 * Create debugging information entry for a vector type.
 * \param Builder      The DIBuilder.
 * \param Size         Vector size.
 * \param AlignInBits  Alignment.
 * \param Ty           Element type.
 * \param Subscripts   Subscripts.
 * \param NumSubscripts Number of subscripts.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайТипВектор(ЛЛПостроительОИ Builder, uint64_t Size,
                              uint32_t AlignInBits, ЛЛМетаданные Ty,
                              ЛЛМетаданные *Subscripts,
                              unsigned NumSubscripts) {
    return LLVMDIBuilderCreateVectorType( Builder,  Size,AlignInBits, Ty,
                              Subscripts, NumSubscripts);
}

/**
 * Create a DWARF unspecified type.
 * \param Builder   The DIBuilder.
 * \param Name      The unspecified type's name.
 * \param NameLen   Length of type name.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайНеукТип(ЛЛПостроительОИ Builder, const char *Name,
                                   size_t NameLen) {
    return LLVMDIBuilderCreateUnspecifiedType( Builder, Name, NameLen);
}

/**
 * Create debugging information entry for a basic
 * type.
 * \param Builder     The DIBuilder.
 * \param Name        Type name.
 * \param NameLen     Length of type name.
 * \param SizeInBits  Size of the type.
 * \param Encoding    DWARF encoding code, e.g. \c LLVMDWARFTypeEncoding_float.
 * \param Flags       Flags to encode optional attribute like endianity
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайБазовыйТип(ЛЛПостроительОИ Builder, const char *Name,
                             size_t NameLen, uint64_t SizeInBits,
                             LLVMDWARFTypeEncoding Encoding,
                             LLVMDIFlags Flags) {
    return LLVMDIBuilderCreateBasicType( Builder, Name,NameLen,  SizeInBits,
                              Encoding, Flags);
}

/**
 * Create debugging information entry for a pointer.
 * \param Builder     The DIBuilder.
 * \param PointeeTy         Type pointed by this pointer.
 * \param SizeInBits        Size.
 * \param AlignInBits       Alignment. (optional, pass 0 to ignore)
 * \param AddressSpace      DWARF address space. (optional, pass 0 to ignore)
 * \param Name              Pointer type name. (optional)
 * \param NameLen           Length of pointer type name. (optional)
 */
LLEXPORT ЛЛМетаданные ЛЛПостроительОИ_СоздайТипУказатель(
    ЛЛПостроительОИ Builder, ЛЛМетаданные PointeeTy,
    uint64_t SizeInBits, uint32_t AlignInBits, unsigned AddressSpace,
    const char *Name, size_t NameLen) {
    return LLVMDIBuilderCreatePointerType(Builder,  PointeeTy,SizeInBits,  AlignInBits,  AddressSpace,
    Name,  NameLen);
}

/**
 * Create debugging information entry for a struct.
 * \param Builder     The DIBuilder.
 * \param Scope        Scope in which this struct is defined.
 * \param Name         Struct name.
 * \param NameLen      Struct name length.
 * \param File         File where this member is defined.
 * \param LineNumber   Line number.
 * \param SizeInBits   Member size.
 * \param AlignInBits  Member alignment.
 * \param Flags        Flags to encode member attribute, e.g. private
 * \param Elements     Struct elements.
 * \param NumElements  Number of struct elements.
 * \param RunTimeLang  Optional parameter, Objective-C runtime version.
 * \param VTableHolder The object containing the vtable for the struct.
 * \param UniqueId     A unique identifier for the struct.
 * \param UniqueIdLen  Length of the unique identifier for the struct.
 */
LLEXPORT ЛЛМетаданные ЛЛПостроительОИ_СоздайТипСтрукт(
    ЛЛПостроительОИ Builder, ЛЛМетаданные Scope, const char *Name,
    size_t NameLen, ЛЛМетаданные File, unsigned LineNumber,
    uint64_t SizeInBits, uint32_t AlignInBits, LLVMDIFlags Flags,
    ЛЛМетаданные DerivedFrom, ЛЛМетаданные *Elements,
    unsigned NumElements, unsigned RunTimeLang, ЛЛМетаданные VTableHolder,
    const char *UniqueId, size_t UniqueIdLen) {
    return LLVMDIBuilderCreateStructType(Builder,  Scope, Name, NameLen,  File,  LineNumber,
     SizeInBits,  AlignInBits,  Flags,DerivedFrom, Elements,NumElements,  RunTimeLang,  VTableHolder,
    UniqueId,  UniqueIdLen) ;
}

/**
 * Create debugging information entry for a member.
 * \param Builder      The DIBuilder.
 * \param Scope        Member scope.
 * \param Name         Member name.
 * \param NameLen      Length of member name.
 * \param File         File where this member is defined.
 * \param LineNo       Line number.
 * \param SizeInBits   Member size.
 * \param AlignInBits  Member alignment.
 * \param OffsetInBits Member offset.
 * \param Flags        Flags to encode member attribute, e.g. private
 * \param Ty           Parent type.
 */
LLEXPORT ЛЛМетаданные ЛЛПостроительОИ_СоздайТипЧлен(
    ЛЛПостроительОИ Builder, ЛЛМетаданные Scope, const char *Name,
    size_t NameLen, ЛЛМетаданные File, unsigned LineNo,
    uint64_t SizeInBits, uint32_t AlignInBits, uint64_t OffsetInBits,
    LLVMDIFlags Flags, ЛЛМетаданные Ty) {
    return LLVMDIBuilderCreateMemberType( Builder,  Scope, Name,NameLen, File, LineNo,
     SizeInBits,  AlignInBits,  OffsetInBits, Flags, Ty);
}

/**
 * Create debugging information entry for a
 * C++ static data member.
 * \param Builder      The DIBuilder.
 * \param Scope        Member scope.
 * \param Name         Member name.
 * \param NameLen      Length of member name.
 * \param File         File where this member is declared.
 * \param LineNumber   Line number.
 * \param Type         Type of the static member.
 * \param Flags        Flags to encode member attribute, e.g. private.
 * \param ConstantVal  Const initializer of the member.
 * \param AlignInBits  Member alignment.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайТипСтатичЧлен(
    ЛЛПостроительОИ Builder, ЛЛМетаданные Scope, const char *Name,
    size_t NameLen, ЛЛМетаданные File, unsigned LineNumber,
    ЛЛМетаданные Type, LLVMDIFlags Flags, ЛЛЗначение ConstantVal,
    uint32_t AlignInBits) {
    return LLVMDIBuilderCreateStaticMemberType(Builder, Scope, Name,
     NameLen,  File,  LineNumber, Type,  Flags,  ConstantVal, AlignInBits);
}

/**
 * Create debugging information entry for a pointer to member.
 * \param Builder      The DIBuilder.
 * \param PointeeType  Type pointed to by this pointer.
 * \param ClassType    Type for which this pointer points to members of.
 * \param SizeInBits   Size.
 * \param AlignInBits  Alignment.
 * \param Flags        Flags.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайТипУкзНаЧлен(ЛЛПостроительОИ Builder,
                                     ЛЛМетаданные PointeeType,
                                     ЛЛМетаданные ClassType,
                                     uint64_t SizeInBits,
                                     uint32_t AlignInBits,
                                     LLVMDIFlags Flags) {
    return LLVMDIBuilderCreateMemberPointerType( Builder,PointeeType,ClassType,
                                      SizeInBits, AlignInBits, Flags);
}
/**
 * Create debugging information entry for Objective-C instance variable.
 * \param Builder      The DIBuilder.
 * \param Name         Member name.
 * \param NameLen      The length of the C string passed to \c Name.
 * \param File         File where this member is defined.
 * \param LineNo       Line number.
 * \param SizeInBits   Member size.
 * \param AlignInBits  Member alignment.
 * \param OffsetInBits Member offset.
 * \param Flags        Flags to encode member attribute, e.g. private
 * \param Ty           Parent type.
 * \param PropertyNode Property associated with this ivar.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайЦВарОбджСи(ЛЛПостроительОИ Builder,
                            const char *Name, size_t NameLen,
                            ЛЛМетаданные File, unsigned LineNo,
                            uint64_t SizeInBits, uint32_t AlignInBits,
                            uint64_t OffsetInBits, LLVMDIFlags Flags,
                            ЛЛМетаданные Ty, ЛЛМетаданные PropertyNode) {
    return LLVMDIBuilderCreateObjCIVar( Builder, Name,  NameLen, File, LineNo,
                             SizeInBits,  AlignInBits,OffsetInBits,  Flags,
                             Ty,  PropertyNode);
}

/**
 * Create debugging information entry for Objective-C property.
 * \param Builder            The DIBuilder.
 * \param Name               Property name.
 * \param NameLen            The length of the C string passed to \c Name.
 * \param File               File where this property is defined.
 * \param LineNo             Line number.
 * \param GetterName         Name of the Objective C property getter selector.
 * \param GetterNameLen      The length of the C string passed to \c GetterName.
 * \param SetterName         Name of the Objective C property setter selector.
 * \param SetterNameLen      The length of the C string passed to \c SetterName.
 * \param PropertyAttributes Objective C property attributes.
 * \param Ty                 Type.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайСвойствоОбджСи(ЛЛПостроительОИ Builder,
                                const char *Name, size_t NameLen,
                                ЛЛМетаданные File, unsigned LineNo,
                                const char *GetterName, size_t GetterNameLen,
                                const char *SetterName, size_t SetterNameLen,
                                unsigned PropertyAttributes,
                                ЛЛМетаданные Ty) {
    return LLVMDIBuilderCreateObjCProperty( Builder, Name,  NameLen,
                                 File,  LineNo,GetterName,  GetterNameLen,
                                SetterName,  SetterNameLen,PropertyAttributes,Ty);
}

/**
 * Create a uniqued DIType* clone with FlagObjectPointer and FlagArtificial set.
 * \param Builder   The DIBuilder.
 * \param Type      The underlying type to which this pointer points.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайТипУкзНаОбъект(ЛЛПостроительОИ Builder,
                                     ЛЛМетаданные Type) {
    return LLVMDIBuilderCreateObjectPointerType( Builder, Type);
}

/**
 * Create debugging information entry for a qualified
 * type, e.g. 'const int'.
 * \param Builder     The DIBuilder.
 * \param Tag         Tag identifying type,
 *                    e.g. LLVMDWARFTypeQualifier_volatile_type
 * \param Type        Base Type.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайКвалифицированныйТип(ЛЛПостроительОИ Builder, unsigned Tag,
                                 ЛЛМетаданные Type) {
    return LLVMDIBuilderCreateQualifiedType( Builder,  Tag, Type);
}
/**
 * Create debugging information entry for a c++
 * style reference or rvalue reference type.
 * \param Builder   The DIBuilder.
 * \param Tag       Tag identifying type,
 * \param Type      Base Type.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайСсылочныйТип(ЛЛПостроительОИ Builder, unsigned Tag,
                                 ЛЛМетаданные Type){
    return LLVMDIBuilderCreateReferenceType( Builder,  Tag, Type);
}

/**
 * Create C++11 nullptr type.
 * \param Builder   The DIBuilder.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайТипНуллУкз(ЛЛПостроительОИ Builder) {
    return LLVMDIBuilderCreateNullPtrType( Builder);
}
/**
 * Create debugging information entry for a typedef.
 * \param Builder    The DIBuilder.
 * \param Type       Original type.
 * \param Name       Typedef name.
 * \param File       File where this type is defined.
 * \param LineNo     Line number.
 * \param Scope      The surrounding context for the typedef.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайТипдеф(ЛЛПостроительОИ Builder, ЛЛМетаданные Type,
                           const char *Name, size_t NameLen,
                           ЛЛМетаданные File, unsigned LineNo,
                           ЛЛМетаданные Scope) {
    return LLVMDIBuilderCreateTypedef( Builder, Type, Name,  NameLen,
                            File,  LineNo, Scope);
}

/**
 * Create debugging information entry to establish inheritance relationship
 * between two types.
 * \param Builder       The DIBuilder.
 * \param Ty            Original type.
 * \param BaseTy        Base type. Ty is inherits from base.
 * \param BaseOffset    Base offset.
 * \param VBPtrOffset  Virtual base pointer offset.
 * \param Flags         Flags to describe inheritance attribute, e.g. private
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайНаследование(ЛЛПостроительОИ Builder,
                               ЛЛМетаданные Ty, ЛЛМетаданные BaseTy,
                               uint64_t BaseOffset, uint32_t VBPtrOffset,
                               LLVMDIFlags Flags) {
    return LLVMDIBuilderCreateInheritance( Builder,Ty,  BaseTy,
                                BaseOffset, VBPtrOffset, Flags);
}
/**
 * Create a permanent forward-declared type.
 * \param Builder             The DIBuilder.
 * \param Tag                 A unique tag for this type.
 * \param Name                Type name.
 * \param NameLen             Length of type name.
 * \param Scope               Type scope.
 * \param File                File where this type is defined.
 * \param Line                Line number where this type is defined.
 * \param RuntimeLang         Indicates runtime version for languages like
 *                            Objective-C.
 * \param SizeInBits          Member size.
 * \param AlignInBits         Member alignment.
 * \param UniqueIdentifier    A unique identifier for the type.
 * \param UniqueIdentifierLen Length of the unique identifier.
 */
LLEXPORT ЛЛМетаданные ЛЛПостроительОИ_СоздайФорвардДекл(
    ЛЛПостроительОИ Builder, unsigned Tag, const char *Name,
    size_t NameLen, ЛЛМетаданные Scope, ЛЛМетаданные File, unsigned Line,
    unsigned RuntimeLang, uint64_t SizeInBits, uint32_t AlignInBits,
    const char *UniqueIdentifier, size_t UniqueIdentifierLen){
  return LLVMDIBuilderCreateForwardDecl(Builder,  Tag, Name,NameLen,  Scope,  File,  Line,
     RuntimeLang,  SizeInBits,  AlignInBits, UniqueIdentifier,  UniqueIdentifierLen);
}

/**
 * Create a temporary forward-declared type.
 * \param Builder             The DIBuilder.
 * \param Tag                 A unique tag for this type.
 * \param Name                Type name.
 * \param NameLen             Length of type name.
 * \param Scope               Type scope.
 * \param File                File where this type is defined.
 * \param Line                Line number where this type is defined.
 * \param RuntimeLang         Indicates runtime version for languages like
 *                            Objective-C.
 * \param SizeInBits          Member size.
 * \param AlignInBits         Member alignment.
 * \param Flags               Flags.
 * \param UniqueIdentifier    A unique identifier for the type.
 * \param UniqueIdentifierLen Length of the unique identifier.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайПеремещаемыйСоставнойТип(
    ЛЛПостроительОИ Builder, unsigned Tag, const char *Name,
    size_t NameLen, ЛЛМетаданные Scope, ЛЛМетаданные File, unsigned Line,
    unsigned RuntimeLang, uint64_t SizeInBits, uint32_t AlignInBits,
    LLVMDIFlags Flags, const char *UniqueIdentifier,
    size_t UniqueIdentifierLen){
  return LLVMDIBuilderCreateReplaceableCompositeType(Builder,  Tag, Name,
     NameLen,  Scope,  File,  Line,RuntimeLang,  SizeInBits,  AlignInBits,
     Flags, UniqueIdentifier, UniqueIdentifierLen);
}

/**
 * Create debugging information entry for a bit field member.
 * \param Builder             The DIBuilder.
 * \param Scope               Member scope.
 * \param Name                Member name.
 * \param NameLen             Length of member name.
 * \param File                File where this member is defined.
 * \param LineNumber          Line number.
 * \param SizeInBits          Member size.
 * \param OffsetInBits        Member offset.
 * \param StorageOffsetInBits Member storage offset.
 * \param Flags               Flags to encode member attribute.
 * \param Type                Parent type.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайТипЧленПоля(ЛЛПостроительОИ Builder,
                                      ЛЛМетаданные Scope,
                                      const char *Name, size_t NameLen,
                                      ЛЛМетаданные File, unsigned LineNumber,
                                      uint64_t SizeInBits,
                                      uint64_t OffsetInBits,
                                      uint64_t StorageOffsetInBits,
                                      LLVMDIFlags Flags, ЛЛМетаданные Type){
  return LLVMDIBuilderCreateBitFieldMemberType( Builder,Scope,Name,  NameLen,
                                       File,  LineNumber, SizeInBits,
                                       OffsetInBits,StorageOffsetInBits,
                                       Flags, Type);
}
/**
 * Create debugging information entry for a class.
 * \param Scope               Scope in which this class is defined.
 * \param Name                Class name.
 * \param NameLen             The length of the C string passed to \c Name.
 * \param File                File where this member is defined.
 * \param LineNumber          Line number.
 * \param SizeInBits          Member size.
 * \param AlignInBits         Member alignment.
 * \param OffsetInBits        Member offset.
 * \param Flags               Flags to encode member attribute, e.g. private.
 * \param DerivedFrom         Debug info of the base class of this type.
 * \param Elements            Class members.
 * \param NumElements         Number of class elements.
 * \param VTableHolder        Debug info of the base class that contains vtable
 *                            for this type. This is used in
 *                            DW_AT_containing_type. See DWARF documentation
 *                            for more info.
 * \param TemplateParamsNode  Template type parameters.
 * \param UniqueIdentifier    A unique identifier for the type.
 * \param UniqueIdentifierLen Length of the unique identifier.
 */
LLEXPORT ЛЛМетаданные ЛЛПостроительОИ_СоздайТипКласс(ЛЛПостроительОИ Builder,
    ЛЛМетаданные Scope, const char *Name, size_t NameLen,
    ЛЛМетаданные File, unsigned LineNumber, uint64_t SizeInBits,
    uint32_t AlignInBits, uint64_t OffsetInBits, LLVMDIFlags Flags,
    ЛЛМетаданные DerivedFrom,
    ЛЛМетаданные *Elements, unsigned NumElements,
    ЛЛМетаданные VTableHolder, ЛЛМетаданные TemplateParamsNode,
    const char *UniqueIdentifier, size_t UniqueIdentifierLen){
  return LLVMDIBuilderCreateClassType( Builder,Scope, Name,  NameLen,
     File,  LineNumber,  SizeInBits, AlignInBits,  OffsetInBits,  Flags,
     DerivedFrom,Elements,  NumElements, VTableHolder,  TemplateParamsNode,
    UniqueIdentifier,  UniqueIdentifierLen);
}

/**
 * Create a uniqued DIType* clone with FlagArtificial set.
 * \param Builder     The DIBuilder.
 * \param Type        The underlying type.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СоздайТипАртифициал(ЛЛПостроительОИ Builder,
                                  ЛЛМетаданные Type){
  return LLVMDIBuilderCreateArtificialType( Builder, Type);
}

/**
 * Get the name of this DIType.
 * \param DType     The DIType.
 * \param Length    The length of the returned string.
 *
 * @see DIType::getName()
 */
LLEXPORT const char *ЛЛТипОИ_ДайИмя(ЛЛМетаданные DType, size_t *Length){
  return LLVMDITypeGetName(DType, Length);
}

/**
 * Get the size of this DIType in bits.
 * \param DType     The DIType.
 *
 * @see DIType::getSizeInBits()
 */
LLEXPORT uint64_t ЛЛТипОИ_ДайРазмВБитах(ЛЛМетаданные DType){
  return LLVMDITypeGetSizeInBits(DType);
}

/**
 * Get the offset of this DIType in bits.
 * \param DType     The DIType.
 *
 * @see DIType::getOffsetInBits()
 */
LLEXPORT uint64_t ЛЛТипОИ_ДайСмещениеВБитах(ЛЛМетаданные DType){
  return LLVMDITypeGetOffsetInBits( DType);
}

/**
 * Get the alignment of this DIType in bits.
 * \param DType     The DIType.
 *
 * @see DIType::getAlignInBits()
 */
LLEXPORT uint32_t ЛЛТипОИ_ДайРаскладкуВБитах(ЛЛМетаданные DType){
  return LLVMDITypeGetAlignInBits(DType);
}

/**
 * Get the source line where this DIType is declared.
 * \param DType     The DIType.
 *
 * @see DIType::getLine()
 */
LLEXPORT unsigned ЛЛТипОИ_ДайСтроку(ЛЛМетаданные DType){
  return LLVMDITypeGetLine( DType);
}

/**
 * Get the flags associated with this DIType.
 * \param DType     The DIType.
 *
 * @see DIType::getFlags()
 */
LLEXPORT LLVMDIFlags ЛЛТипОИ_ДайФлаги(ЛЛМетаданные DType){
  return LLVMDITypeGetFlags( DType);
}

/**
 * Create a descriptor for a value range.
 * \param Builder    The DIBuilder.
 * \param LowerBound Lower bound of the subrange, e.g. 0 for C, 1 for Fortran.
 * \param Count      Count of elements in the subrange.
 */
LLEXPORT ЛЛМетаданные ЛЛПостроительОИ_ДайИлиСоздайПоддиапазон(ЛЛПостроительОИ Builder,
                                                 int64_t LowerBound,
                                                 int64_t Count){
  return LLVMDIBuilderGetOrCreateSubrange(Builder, LowerBound, Count);
}

/**
 * Create an array of DI Nodes.
 * \param Builder        The DIBuilder.
 * \param Data           The DI Node elements.
 * \param NumElements    Number of DI Node elements.
 */
LLEXPORT ЛЛМетаданные ЛЛПостроительОИ_ДайИлиСоздайМассив(ЛЛПостроительОИ Builder,
                                              ЛЛМетаданные *Data,
                                              size_t NumElements){
  return LLVMDIBuilderGetOrCreateArray(Builder, Data, NumElements) ;
}

/**
 * Create a new descriptor for the specified variable which has a complex
 * address Expression for its address.
 * \param Builder     The DIBuilder.
 * \param Addr        An array of complex address operations.
 * \param Length      Length of the address operation array.
 */
LLEXPORT ЛЛМетаданные ЛЛПостроительОИ_СоздайExpression(ЛЛПостроительОИ Builder,
                                              int64_t *Addr, size_t Length){
  return LLVMDIBuilderCreateExpression(Builder, Addr,  Length);
}

/**
 * Create a new descriptor for the specified variable that does not have an
 * address, but does have a constant value.
 * \param Builder     The DIBuilder.
 * \param Value       The constant value.
 */
LLEXPORT ЛЛМетаданные
ЛЛПостроительОИ_СОздайВыражениеКонстЗначения(ЛЛПостроительОИ Builder,
                                           int64_t Value){
  return LLVMDIBuilderCreateConstantValueExpression( Builder, Value);
}
/**
 * Create a new descriptor for the specified variable.
 * \param Scope       Variable scope.
 * \param Name        Name of the variable.
 * \param NameLen     The length of the C string passed to \c Name.
 * \param ЛЛКомпоновка     Mangled  name of the variable.
 * \param LinkLen     The length of the C string passed to \c ЛЛКомпоновка.
 * \param File        File where this variable is defined.
 * \param LineNo      Line number.
 * \param Ty          Variable Type.
 * \param LocalToUnit Boolean flag indicate whether this variable is
 *                    externally visible or not.
 * \param Expr        The location of the global relative to the attached
 *                    GlobalVariable.
 * \param Decl        Reference to the corresponding declaration.
 *                    variables.
 * \param AlignInBits Variable alignment(or 0 if no alignment attr was
 *                    specified)
 */
LLEXPORT ЛЛМетаданные ЛЛПостроительОИ_СоздайВыражениеГлобПеременной(
    ЛЛПостроительОИ Builder, ЛЛМетаданные Scope, const char *Name,
    size_t NameLen, const char *ЛЛКомпоновка, size_t LinkLen, ЛЛМетаданные File,
    unsigned LineNo, ЛЛМетаданные Ty, ЛЛБул LocalToUnit,
    ЛЛМетаданные Expr, ЛЛМетаданные Decl, uint32_t AlignInBits){
  return LLVMDIBuilderCreateGlobalVariableExpression(Builder,  Scope, Name,
     NameLen, ЛЛКомпоновка,  LinkLen,  File, LineNo,  Ty,  LocalToUnit,
     Expr,  Decl,  AlignInBits);
}
/**
 * Retrieves the \c DIVariable associated with this global variable Expression.
 * \param GVE    The global variable Expression.
 *
 * @see llvm::DIGlobalVariableExpression::getVariable()
 */
LLEXPORT ЛЛМетаданные ЛЛExprГлобПеременной_ДайПеременную(ЛЛМетаданные GVE){
  return LLVMDIGlobalVariableExpressionGetVariable(GVE);
}

/**
 * Retrieves the \c DIExpression associated with this global variable Expression.
 * \param GVE    The global variable Expression.
 *
 * @see llvm::DIGlobalVariableExpression::getExpression()
 */
LLEXPORT ЛЛМетаданные ЛЛВыражениеГлобПеременной_ДайВыражение(
    ЛЛМетаданные GVE){
  return LLVMDIGlobalVariableExpressionGetExpression(GVE);
}
/**
 * Get the metadata of the file associated with a given variable.
 * \param Var     The variable object.
 *
 * @see DIVariable::getFile()
 */
LLEXPORT ЛЛМетаданные ЛЛПеременнаяОИ_ДайФайл(ЛЛМетаданные Var){
  return LLVMDIVariableGetFile( Var);
}
/**
 * Get the metadata of the scope associated with a given variable.
 * \param Var     The variable object.
 *
 * @see DIVariable::getScope()
 */
LLEXPORT ЛЛМетаданные ЛЛПеременнаяОИ_ДайМасштаб(ЛЛМетаданные Var){
  return LLVMDIVariableGetScope(Var);
}
/**
 * Get the source line where this \c DIVariable is declared.
 * \param Var     The DIVariable.
 *
 * @see DIVariable::getLine()
 */
LLEXPORT unsigned ЛЛПеременнаяОИ_ДайСтроку(ЛЛМетаданные Var){
  return LLVMDIVariableGetLine(Var);
}
/**
 * Create a new temporary \c MDNode.  Suitable for use in constructing cyclic
 * \c MDNode structures. A temporary \c MDNode is not uniqued, may be RAUW'd,
 * and must be manually deleted with \c LLVMDisposeTemporaryMDNode.
 * \param Ctx            The context in which to construct the temporary node.
 * \param Data           The metadata elements.
 * \param NumElements    Number of metadata elements.
 */
LLEXPORT ЛЛМетаданные ЛЛВременныйУзелМД(LLVMContextRef Ctx, ЛЛМетаданные *Data,
                                    size_t NumElements){
  return LLVMTemporaryMDNode(Ctx, Data, NumElements);
}
/**
 * Deallocate a temporary node.
 *
 * Calls \c replaceAllUsesWith(nullptr) before deleting, so any remaining
 * references will be reset.
 * \param TempNode    The temporary metadata node.
 */
LLEXPORT void ЛЛВыместиВременныйУзелМД(ЛЛМетаданные TempNode){
   LLVMDisposeTemporaryMDNode( TempNode);
}
/**
 * Replace all uses of temporary metadata.
 * \param TempTargetMetadata    The temporary metadata node.
 * \param Replacement           The replacement metadata node.
 */
LLEXPORT void ЛЛМетаданные_ЗамениВсеИспользованияНа(ЛЛМетаданные TempTargetMetadata,
                                    ЛЛМетаданные Replacement){
   LLVMMetadataReplaceAllUsesWith( TempTargetMetadata, Replacement);
}
/**
 * Create a new descriptor for the specified global variable that is temporary
 * and meant to be RAUWed.
 * \param Scope       Variable scope.
 * \param Name        Name of the variable.
 * \param NameLen     The length of the C string passed to \c Name.
 * \param ЛЛКомпоновка     Mangled  name of the variable.
 * \param LnkLen      The length of the C string passed to \c ЛЛКомпоновка.
 * \param File        File where this variable is defined.
 * \param LineNo      Line number.
 * \param Ty          Variable Type.
 * \param LocalToUnit Boolean flag indicate whether this variable is
 *                    externally visible or not.
 * \param Decl        Reference to the corresponding declaration.
 * \param AlignInBits Variable alignment(or 0 if no alignment attr was
 *                    specified)
 */
LLEXPORT ЛЛМетаданные ЛЛПостроительОИ_СоздайВремФорвардДеклГлобПерем(
    ЛЛПостроительОИ Builder, ЛЛМетаданные Scope, const char *Name,
    size_t NameLen, const char *ЛЛКомпоновка, size_t LnkLen, ЛЛМетаданные File,
    unsigned LineNo, ЛЛМетаданные Ty, ЛЛБул LocalToUnit,
    ЛЛМетаданные Decl, uint32_t AlignInBits){
  return LLVMDIBuilderCreateTempGlobalVariableFwdDecl(Builder,  Scope, Name,
     NameLen, ЛЛКомпоновка,  LnkLen,  File,LineNo,  Ty,  LocalToUnit, Decl,  AlignInBits);
}
/**
 * Insert a new llvm.dbg.declare intrinsic call before the given instruction.
 * \param Builder     The DIBuilder.
 * \param Storage     The storage of the variable to declare.
 * \param VarInfo     The variable's debug info descriptor.
 * \param Expr        A complex location Expression for the variable.
 * \param DebugLoc    Debug info location.
 * \param Instr       Instruction acting as a location for the new intrinsic.
 */
LLEXPORT ЛЛЗначение ЛЛПостроительОИ_ВставьДекларПеред(
  ЛЛПостроительОИ Builder, ЛЛЗначение Storage, ЛЛМетаданные VarInfo,
  ЛЛМетаданные Expr, ЛЛМетаданные DebugLoc, ЛЛЗначение Instr){
  return LLVMDIBuilderInsertDeclareBefore(Builder,  Storage,  VarInfo,
   Expr,  DebugLoc,  Instr);
}
/**
 * Insert a new llvm.dbg.declare intrinsic call at the end of the given basic
 * block. If the basic block has a terminator instruction, the intrinsic is
 * inserted before that terminator instruction.
 * \param Builder     The DIBuilder.
 * \param Storage     The storage of the variable to declare.
 * \param VarInfo     The variable's debug info descriptor.
 * \param Expr        A complex location Expression for the variable.
 * \param DebugLoc    Debug info location.
 * \param Block       Basic block acting as a location for the new intrinsic.
 */
LLEXPORT ЛЛЗначение ЛЛПостроительОИ_ВставьДекларВКонце(
    ЛЛПостроительОИ Builder, ЛЛЗначение Storage, ЛЛМетаданные VarInfo,
    ЛЛМетаданные Expr, ЛЛМетаданные DebugLoc, ЛЛБазовыйБлок Block){
  return LLVMDIBuilderInsertDeclareAtEnd(Builder,  Storage,  VarInfo, Expr,  DebugLoc,  Block);
}
/**
 * Insert a new llvm.dbg.value intrinsic call before the given instruction.
 * \param Builder     The DIBuilder.
 * \param Val         The value of the variable.
 * \param VarInfo     The variable's debug info descriptor.
 * \param Expr        A complex location Expression for the variable.
 * \param DebugLoc    Debug info location.
 * \param Instr       Instruction acting as a location for the new intrinsic.
 */
LLEXPORT ЛЛЗначение ЛЛПостроительОИ_ВставьОтладЗначениеПеред(ЛЛПостроительОИ Builder,
                                               ЛЛЗначение Val,
                                               ЛЛМетаданные VarInfo,
                                               ЛЛМетаданные Expr,
                                               ЛЛМетаданные DebugLoc,
                                               ЛЛЗначение Instr){
  return LLVMDIBuilderInsertDbgValueBefore( Builder,Val,VarInfo,Expr,
                                                DebugLoc, Instr);
}
/**
 * Insert a new llvm.dbg.value intrinsic call at the end of the given basic
 * block. If the basic block has a terminator instruction, the intrinsic is
 * inserted before that terminator instruction.
 * \param Builder     The DIBuilder.
 * \param Val         The value of the variable.
 * \param VarInfo     The variable's debug info descriptor.
 * \param Expr        A complex location Expression for the variable.
 * \param DebugLoc    Debug info location.
 * \param Block       Basic block acting as a location for the new intrinsic.
 */
LLEXPORT ЛЛЗначение ЛЛПостроительОИ_ВставьОтладЗначениеВКонце(ЛЛПостроительОИ Builder,
                                              ЛЛЗначение Val,
                                              ЛЛМетаданные VarInfo,
                                              ЛЛМетаданные Expr,
                                              ЛЛМетаданные DebugLoc,
                                              ЛЛБазовыйБлок Block){
  return LLVMDIBuilderInsertDbgValueAtEnd( Builder, Val,VarInfo, Expr,
                                               DebugLoc, Block);
}
 /* Create a new descriptor for a local auto variable.
 * \param Builder         The DIBuilder.
 * \param Scope           The local scope the variable is declared in.
 * \param Name            Variable name.
 * \param NameLen         Length of variable name.
 * \param File            File where this variable is defined.
 * \param LineNo          Line number.
 * \param Ty              Metadata describing the type of the variable.
 * \param AlwaysPreserve  If true, this descriptor will survive optimizations.
 * \param Flags           Flags.
 * \param AlignInBits     Variable alignment.
 */
LLEXPORT ЛЛМетаданные ЛЛПостроительОИ_СоздайАвтоПеременную(
    ЛЛПостроительОИ Builder, ЛЛМетаданные Scope, const char *Name,
    size_t NameLen, ЛЛМетаданные File, unsigned LineNo, ЛЛМетаданные Ty,
    ЛЛБул AlwaysPreserve, LLVMDIFlags Flags, uint32_t AlignInBits){
  return LLVMDIBuilderCreateAutoVariable(Builder, Scope, Name,
     NameLen,  File,  LineNo,  Ty, AlwaysPreserve, Flags, AlignInBits);
}
/**
 * Create a new descriptor for a function parameter variable.
 * \param Builder         The DIBuilder.
 * \param Scope           The local scope the variable is declared in.
 * \param Name            Variable name.
 * \param NameLen         Length of variable name.
 * \param ArgNo           Unique argument number for this variable; starts at 1.
 * \param File            File where this variable is defined.
 * \param LineNo          Line number.
 * \param Ty              Metadata describing the type of the variable.
 * \param AlwaysPreserve  If true, this descriptor will survive optimizations.
 * \param Flags           Flags.
 */
LLEXPORT ЛЛМетаданные ЛЛПостроительОИ_СоздайПеременнуюПараметра(
    ЛЛПостроительОИ Builder, ЛЛМетаданные Scope, const char *Name,
    size_t NameLen, unsigned ArgNo, ЛЛМетаданные File, unsigned LineNo,
    ЛЛМетаданные Ty, ЛЛБул AlwaysPreserve, LLVMDIFlags Flags){
  return LLVMDIBuilderCreateParameterVariable(Builder,  Scope, Name,
     NameLen,  ArgNo,  File,  LineNo, Ty, AlwaysPreserve,  Flags);
}
 /* Get the metadata of the subprogram attached to a function.
 *
 * @see llvm::Function::getSubprogram()
 */
LLEXPORT ЛЛМетаданные ЛЛДайПодпрограмму(ЛЛЗначение Func){
  return LLVMGetSubprogram(Func) ;
}
/**
 * Set the subprogram attached to a function.
 *
 * @see llvm::Function::setSubprogram()
 */
LLEXPORT void ЛЛУстПодпрограмму(ЛЛЗначение Func, ЛЛМетаданные SP){
  return LLVMSetSubprogram(Func, SP);
}
/**
 * Get the line associated with a given subprogram.
 * \param Subprogram     The subprogram object.
 *
 * @see DISubprogram::getLine()
 */
LLEXPORT unsigned ЛЛПодпрогаОИ_ДайСтроку(ЛЛМетаданные Subprogram){
  return LLVMDISubprogramGetLine( Subprogram);
}
/**
 * Get the debug location for the given instruction.
 *
 * @see llvm::Instruction::getDebugLoc()
 */
LLEXPORT ЛЛМетаданные ЛЛИнструкция_ДайОтладЛок(ЛЛЗначение Inst){
  return LLVMInstructionGetDebugLoc( Inst);
}
/**
 * Set the debug location for the given instruction.
 *
 * To clear the location metadata of the given instruction, pass NULL to \p Loc.
 *
 * @see llvm::Instruction::setDebugLoc()
 */
LLEXPORT void ЛЛИнструкция_УстОтладЛок(ЛЛЗначение Inst, ЛЛМетаданные Loc){
  return LLVMInstructionSetDebugLoc(Inst,  Loc);
}
/**
 * Obtain the enumerated type of a Metadata instance.
 *
 * @see llvm::Metadata::getMetadataID()
 */
LLEXPORT LLVMMetadataKind ЛЛДайРодМетаданных(ЛЛМетаданные Metadata) {
    return LLVMGetMetadataKind( Metadata);
}


} /* end extern "C" */
