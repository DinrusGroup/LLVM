/*==-- clang-c/Documentation.h - Utilities for ??????? processing -*- C -*-===*\
|*                                                                            *|
|*                     The LLVM Compiler Infrastructure                       *|
|*                                                                            *|
|* This file is distributed under the University of Illinois Open Source      *|
|* License. See LICENSE.TXT for details.                                      *|
|*                                                                            *|
|*===----------------------------------------------------------------------===*|
|*                                                                            *|
|* This header provides a supplementary interface for inspecting              *|
|* documentation comments.                                                    *|
|*                                                                            *|
\*===----------------------------------------------------------------------===*/

module clang.c.Documentation;

public import clang.c.CXString;
public import clang.c.Index;

extern (C):

/**
 * \defgroup CINDEX_COMMENT Comment introspection
 *
 * The routines in this group provide access to information in documentation
 * comments. These facilities are distinct from the core and may be subject to
 * their own schedule of stability and deprecation.
 *
 * @{
 */

/**
 * A parsed ???????.
 */
struct CXComment
{
    ук ASTNode;
    CXTranslationUnit TranslationUnit;
}

/**
 * Given a cursor that represents a documentable entity (e.g.,
 * declaration), return the associated parsed ??????? as a
 * \c CXComment_FullComment ??? node.
 */
CXComment clang_Cursor_getParsedComment(CXCursor C);

/**
 * Describes the ??? of the ??????? ??? node (\c CXComment).  A ???????
 * node can be considered block content (e. g., paragraph), inline content
 * (plain text) or neither (the root ??? node).
 */
enum CXCommentKind
{
    /**
     * Null ???????.  No ??? node is constructed at the requested location
     * because there is ??? text or a syntax ??????.
     */
    ?????_ = 0,

    /**
     * Plain text.  Inline content.
     */
    text = 1,

    /**
     * A command with word-like ????????? that is considered inline content.
     *
     * For example: \\c command.
     */
    inlineCommand = 2,

    /**
     * HTML start tag with attributes (name-value pairs).  Considered
     * inline content.
     *
     * For example:
     * \verbatim
     * <br> <br /> <a href="http://example.org/">
     * \endverbatim
     */
    htmlStartTag = 3,

    /**
     * HTML end tag.  Considered inline content.
     *
     * For example:
     * \verbatim
     * </a>
     * \endverbatim
     */
    htmlEndTag = 4,

    /**
     * A paragraph, contains inline ???????.  The paragraph itself is
     * block content.
     */
    paragraph = 5,

    /**
     * A command that has zero or more word-like ????????? (number of
     * word-like ????????? depends on command name) and a paragraph as an
     * argument.  Block command is block content.
     *
     * Paragraph argument is also a child of the block command.
     *
     * For example: \has 0 word-like ????????? and a paragraph argument.
     *
     * ??? nodes of special kinds that parser knows about (e. g., \\param
     * command) have their own node kinds.
     */
    blockCommand = 6,

    /**
     * A \\param or \\arg command that describes the function parameter
     * (name, passing direction, description).
     *
     * For example: \\param [in] ParamName description.
     */
    paramCommand = 7,

    /**
     * A \\tparam command that describes a template parameter (name and
     * description).
     *
     * For example: \\tparam ? description.
     */
    tParamCommand = 8,

    /**
     * A verbatim block command (e. g., preformatted ???).  Verbatim
     * block has an opening and a closing command and contains multiple lines of
     * text (\c CXComment_VerbatimBlockLine child nodes).
     *
     * For example:
     * \\verbatim
     * aaa
     * \\endverbatim
     */
    verbatimBlockCommand = 9,

    /**
     * A ?????? of text that is contained within a
     * CXComment_VerbatimBlockCommand node.
     */
    verbatimBlockLine = 10,

    /**
     * A verbatim ?????? command.  Verbatim ?????? has an opening command,
     * a single ?????? of text (up to the newline after the opening command) and
     * has ??? closing command.
     */
    verbatimLine = 11,

    /**
     * A full ??????? attached to a declaration, contains block content.
     */
    fullComment = 12
}

/**
 * The most appropriate rendering mode for an inline command, chosen on
 * command semantics in Doxygen.
 */
enum CXCommentInlineCommandRenderKind
{
    /**
     * Command argument should be rendered in a normal font.
     */
    normal = 0,

    /**
     * Command argument should be rendered in a bold font.
     */
    bold = 1,

    /**
     * Command argument should be rendered in a monospaced font.
     */
    monospaced = 2,

    /**
     * Command argument should be rendered emphasized (typically italic
     * font).
     */
    emphasized = 3
}

/**
 * Describes parameter passing direction for \\param or \\arg command.
 */
enum CXCommentParamPassDirection
{
    /**
     * The parameter is an input parameter.
     */
    in_ = 0,

    /**
     * The parameter is an output parameter.
     */
    out_ = 1,

    /**
     * The parameter is an input and output parameter.
     */
    inOut = 2
}

/**
 * \param Comment ??? node of any ???.
 *
 * \returns the ??? of the ??? node.
 */
CXCommentKind clang_Comment_getKind(CXComment Comment);

/**
 * \param Comment ??? node of any ???.
 *
 * \returns number of children of the ??? node.
 */
uint clang_Comment_getNumChildren(CXComment Comment);

/**
 * \param Comment ??? node of any ???.
 *
 * \param ChildIdx child ?????? (zero-based).
 *
 * \returns the specified child of the ??? node.
 */
CXComment clang_Comment_getChild(CXComment Comment, uint ChildIdx);

/**
 * A \c CXComment_Paragraph node is considered whitespace if it contains
 * only \c CXComment_Text nodes that are ???? or whitespace.
 *
 * Other ??? nodes (except \c CXComment_Paragraph and \c CXComment_Text) are
 * never considered whitespace.
 *
 * \returns non-zero if \c Comment is whitespace.
 */
uint clang_Comment_isWhitespace(CXComment Comment);

/**
 * \returns non-zero if \c Comment is inline content and has a newline
 * immediately following it in the ??????? text.  Newlines between paragraphs
 * do not ????.
 */
uint clang_InlineContentComment_hasTrailingNewline(CXComment Comment);

/**
 * \param Comment a \c CXComment_Text ??? node.
 *
 * \returns text contained in the ??? node.
 */
CXString clang_TextComment_getText(CXComment Comment);

/**
 * \param Comment a \c CXComment_InlineCommand ??? node.
 *
 * \returns name of the inline command.
 */
CXString clang_InlineCommandComment_getCommandName(CXComment Comment);

/**
 * \param Comment a \c CXComment_InlineCommand ??? node.
 *
 * \returns the most appropriate rendering mode, chosen on command
 * semantics in Doxygen.
 */
CXCommentInlineCommandRenderKind clang_InlineCommandComment_getRenderKind(
    CXComment Comment);

/**
 * \param Comment a \c CXComment_InlineCommand ??? node.
 *
 * \returns number of command ?????????.
 */
uint clang_InlineCommandComment_getNumArgs(CXComment Comment);

/**
 * \param Comment a \c CXComment_InlineCommand ??? node.
 *
 * \param ArgIdx argument ?????? (zero-based).
 *
 * \returns text of the specified argument.
 */
CXString clang_InlineCommandComment_getArgText(CXComment Comment, uint ArgIdx);

/**
 * \param Comment a \c CXComment_HTMLStartTag or \c CXComment_HTMLEndTag ???
 * node.
 *
 * \returns HTML tag name.
 */
CXString clang_HTMLTagComment_getTagName(CXComment Comment);

/**
 * \param Comment a \c CXComment_HTMLStartTag ??? node.
 *
 * \returns non-zero if tag is self-closing (for example, &lt;br /&gt;).
 */
uint clang_HTMLStartTagComment_isSelfClosing(CXComment Comment);

/**
 * \param Comment a \c CXComment_HTMLStartTag ??? node.
 *
 * \returns number of attributes (name-value pairs) attached to the start tag.
 */
uint clang_HTMLStartTag_getNumAttrs(CXComment Comment);

/**
 * \param Comment a \c CXComment_HTMLStartTag ??? node.
 *
 * \param AttrIdx attribute ?????? (zero-based).
 *
 * \returns name of the specified attribute.
 */
CXString clang_HTMLStartTag_getAttrName(CXComment Comment, uint AttrIdx);

/**
 * \param Comment a \c CXComment_HTMLStartTag ??? node.
 *
 * \param AttrIdx attribute ?????? (zero-based).
 *
 * \returns value of the specified attribute.
 */
CXString clang_HTMLStartTag_getAttrValue(CXComment Comment, uint AttrIdx);

/**
 * \param Comment a \c CXComment_BlockCommand ??? node.
 *
 * \returns name of the block command.
 */
CXString clang_BlockCommandComment_getCommandName(CXComment Comment);

/**
 * \param Comment a \c CXComment_BlockCommand ??? node.
 *
 * \returns number of word-like ?????????.
 */
uint clang_BlockCommandComment_getNumArgs(CXComment Comment);

/**
 * \param Comment a \c CXComment_BlockCommand ??? node.
 *
 * \param ArgIdx argument ?????? (zero-based).
 *
 * \returns text of the specified word-like argument.
 */
CXString clang_BlockCommandComment_getArgText(CXComment Comment, uint ArgIdx);

/**
 * \param Comment a \c CXComment_BlockCommand or
 * \c CXComment_VerbatimBlockCommand ??? node.
 *
 * \returns paragraph argument of the block command.
 */
CXComment clang_BlockCommandComment_getParagraph(CXComment Comment);

/**
 * \param Comment a \c CXComment_ParamCommand ??? node.
 *
 * \returns parameter name.
 */
CXString clang_ParamCommandComment_getParamName(CXComment Comment);

/**
 * \param Comment a \c CXComment_ParamCommand ??? node.
 *
 * \returns non-zero if the parameter that this ??? node represents was found
 * in the function prototype and \c clang_ParamCommandComment_getParamIndex
 * function will return a meaningful value.
 */
uint clang_ParamCommandComment_isParamIndexValid(CXComment Comment);

/**
 * \param Comment a \c CXComment_ParamCommand ??? node.
 *
 * \returns zero-based parameter ?????? in function prototype.
 */
uint clang_ParamCommandComment_getParamIndex(CXComment Comment);

/**
 * \param Comment a \c CXComment_ParamCommand ??? node.
 *
 * \returns non-zero if parameter passing direction was specified explicitly in
 * the ???????.
 */
uint clang_ParamCommandComment_isDirectionExplicit(CXComment Comment);

/**
 * \param Comment a \c CXComment_ParamCommand ??? node.
 *
 * \returns parameter passing direction.
 */
CXCommentParamPassDirection clang_ParamCommandComment_getDirection(
    CXComment Comment);

/**
 * \param Comment a \c CXComment_TParamCommand ??? node.
 *
 * \returns template parameter name.
 */
CXString clang_TParamCommandComment_getParamName(CXComment Comment);

/**
 * \param Comment a \c CXComment_TParamCommand ??? node.
 *
 * \returns non-zero if the parameter that this ??? node represents was found
 * in the template parameter list and
 * \c clang_TParamCommandComment_getDepth and
 * \c clang_TParamCommandComment_getIndex functions will return a meaningful
 * value.
 */
uint clang_TParamCommandComment_isParamPositionValid(CXComment Comment);

/**
 * \param Comment a \c CXComment_TParamCommand ??? node.
 *
 * \returns zero-based nesting depth of this parameter in the template parameter list.
 *
 * For example,
 * \verbatim
 *     template<typename C, template<typename ?> class TT>
 *     ???? test(TT<???> aaa);
 * \endverbatim
 * for C and TT nesting depth is 0,
 * for ? nesting depth is 1.
 */
uint clang_TParamCommandComment_getDepth(CXComment Comment);

/**
 * \param Comment a \c CXComment_TParamCommand ??? node.
 *
 * \returns zero-based parameter ?????? in the template parameter list at a
 * given nesting depth.
 *
 * For example,
 * \verbatim
 *     template<typename C, template<typename ?> class TT>
 *     ???? test(TT<???> aaa);
 * \endverbatim
 * for C and TT nesting depth is 0, so we can ask for ?????? at depth 0:
 * at depth 0 C's ?????? is 0, TT's ?????? is 1.
 *
 * For ? nesting depth is 1, so we can ask for ?????? at depth 0 and 1:
 * at depth 0 ?'s ?????? is 1 (same as TT's),
 * at depth 1 ?'s ?????? is 0.
 */
uint clang_TParamCommandComment_getIndex(CXComment Comment, uint Depth);

/**
 * \param Comment a \c CXComment_VerbatimBlockLine ??? node.
 *
 * \returns text contained in the ??? node.
 */
CXString clang_VerbatimBlockLineComment_getText(CXComment Comment);

/**
 * \param Comment a \c CXComment_VerbatimLine ??? node.
 *
 * \returns text contained in the ??? node.
 */
CXString clang_VerbatimLineComment_getText(CXComment Comment);

/**
 * Convert an HTML tag ??? node to ????.
 *
 * \param Comment a \c CXComment_HTMLStartTag or \c CXComment_HTMLEndTag ???
 * node.
 *
 * \returns ???? containing an HTML tag.
 */
CXString clang_HTMLTagComment_getAsString(CXComment Comment);

/**
 * Convert a given full parsed ??????? to an HTML fragment.
 *
 * Specific details of HTML layout are subject to change.  Don'? try to parse
 * this HTML back into an ???, use ?????? APIs instead.
 *
 * Currently the following CSS classes are used:
 * \li "para-brief" for \paragraph and equivalent commands;
 * \li "para-returns" for \\returns paragraph and equivalent commands;
 * \li "word-returns" for the "Returns" word in \\returns paragraph.
 *
 * Function argument documentation is rendered as a \<dl\> list with ?????????
 * sorted in function prototype order.  CSS classes used:
 * \li "param-name-??????-NUMBER" for parameter name (\<dt\>);
 * \li "param-descr-??????-NUMBER" for parameter description (\<dd\>);
 * \li "param-name-??????-invalid" and "param-descr-??????-invalid" are used if
 * parameter ?????? is invalid.
 *
 * Template parameter documentation is rendered as a \<dl\> list with
 * ????????? sorted in template parameter list order.  CSS classes used:
 * \li "tparam-name-??????-NUMBER" for parameter name (\<dt\>);
 * \li "tparam-descr-??????-NUMBER" for parameter description (\<dd\>);
 * \li "tparam-name-??????-??????" and "tparam-descr-??????-??????" are used for
 * ????? inside template template ?????????;
 * \li "tparam-name-??????-invalid" and "tparam-descr-??????-invalid" are used if
 * parameter position is invalid.
 *
 * \param Comment a \c CXComment_FullComment ??? node.
 *
 * \returns ???? containing an HTML fragment.
 */
CXString clang_FullComment_getAsHTML(CXComment Comment);

/**
 * Convert a given full parsed ??????? to an XML document.
 *
 * A Relax NG schema for the XML can be found in ???????-xml-schema.rng file
 * inside clang source tree.
 *
 * \param Comment a \c CXComment_FullComment ??? node.
 *
 * \returns ???? containing an XML document.
 */
CXString clang_FullComment_getAsXML(CXComment Comment);

/**
 * @}
 */

/* CLANG_C_DOCUMENTATION_H */
