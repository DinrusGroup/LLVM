/*==-- clang-c/BuildSystem.h - Utilities for use by build systems -*- C -*-===*\
|*                                                                            *|
|*                     The LLVM Compiler Infrastructure                       *|
|*                                                                            *|
|* This file is distributed under the University of Illinois Open Source      *|
|* License. See LICENSE.TXT for details.                                      *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header provides various utilities for use by build systems.           *|
|*                                                                            *|
\*===----------------------------------------------------------------------===*/

module clang.c.BuildSystem;

public import clang.c.CXErrorCode;

extern (C):

/**
 * \defgroup BUILD_SYSTEM Build system utilities
 * @{
 */

/**
 * Return the timestamp for use with Clang's
 * \c -fbuild-session-timestamp= option.
 */
бдол clang_getBuildSessionTimestamp();

/**
 * Object encapsulating information about overlaying virtual
 * file/directories over the real file system.
 */
struct CXVirtualFileOverlayImpl;
alias CXVirtualFileOverlayImpl* CXVirtualFileOverlay;

/**
 * Create a \c CXVirtualFileOverlay object.
 * Must be disposed with \c clang_VirtualFileOverlay_dispose().
 *
 * \param options is reserved, always pass 0.
 */
CXVirtualFileOverlay clang_VirtualFileOverlay_create(uint options);

/**
 * Map an absolute virtual file path to an absolute real один.
 * The virtual path must be canonicalized (not contain "."/"..").
 * \returns 0 for success, non-zero to indicate an ошибка.
 */
CXErrorCode clang_VirtualFileOverlay_addFileMapping(
    CXVirtualFileOverlay,
    ткст0 virtualPath,
    ткст0 realPath);

/**
 * Set the case sensitivity for the \c CXVirtualFileOverlay object.
 * The \c CXVirtualFileOverlay object is case-sensitive by default, this
 * option can be used to override the default.
 * \returns 0 for success, non-zero to indicate an ошибка.
 */
CXErrorCode clang_VirtualFileOverlay_setCaseSensitivity(
    CXVirtualFileOverlay,
    цел caseSensitive);

/**
 * Write out the \c CXVirtualFileOverlay object to a сим buffer.
 *
 * \param options is reserved, always pass 0.
 * \param out_buffer_ptr pointer to receive the buffer pointer, which should be
 * disposed using \c clang_free().
 * \param out_buffer_size pointer to receive the buffer size.
 * \returns 0 for success, non-zero to indicate an ошибка.
 */
CXErrorCode clang_VirtualFileOverlay_writeToBuffer(
    CXVirtualFileOverlay,
    uint options,
    сим** out_buffer_ptr,
    uint* out_buffer_size);

/**
 * free memory allocated by libclang, such as the buffer returned by
 * \c CXVirtualFileOverlay() or \c clang_ModuleMapDescriptor_writeToBuffer().
 *
 * \param buffer memory pointer to free.
 */
проц clang_free(ук buffer);

/**
 * Dispose a \c CXVirtualFileOverlay object.
 */
проц clang_VirtualFileOverlay_dispose(CXVirtualFileOverlay);

/**
 * Object encapsulating information about a module.map file.
 */
struct CXModuleMapDescriptorImpl;
alias  CXModuleMapDescriptorImpl* CXModuleMapDescriptor;

/**
 * Create a \c CXModuleMapDescriptor object.
 * Must be disposed with \c clang_ModuleMapDescriptor_dispose().
 *
 * \param options is reserved, always pass 0.
 */
CXModuleMapDescriptor clang_ModuleMapDescriptor_create(uint options);

/**
 * Sets the framework module name that the module.map describes.
 * \returns 0 for success, non-zero to indicate an ошибка.
 */
CXErrorCode clang_ModuleMapDescriptor_setFrameworkModuleName(
    CXModuleMapDescriptor,
    ткст0 name);

/**
 * Sets the umbrealla header name that the module.map describes.
 * \returns 0 for success, non-zero to indicate an ошибка.
 */
CXErrorCode clang_ModuleMapDescriptor_setUmbrellaHeader(
    CXModuleMapDescriptor,
    ткст0 name);

/**
 * Write out the \c CXModuleMapDescriptor object to a сим buffer.
 *
 * \param options is reserved, always pass 0.
 * \param out_buffer_ptr pointer to receive the buffer pointer, which should be
 * disposed using \c clang_free().
 * \param out_buffer_size pointer to receive the buffer size.
 * \returns 0 for success, non-zero to indicate an ошибка.
 */
CXErrorCode clang_ModuleMapDescriptor_writeToBuffer(
    CXModuleMapDescriptor,
    uint options,
    сим** out_buffer_ptr,
    uint* out_buffer_size);

/**
 * Dispose a \c CXModuleMapDescriptor object.
 */
проц clang_ModuleMapDescriptor_dispose(CXModuleMapDescriptor);

/**
 * @}
 */

/* CLANG_C_BUILD_SYSTEM_H */
