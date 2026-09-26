AC_INIT([wmctrl-fork], 1.09.03)
AC_CONFIG_SRCDIR([main.c])
AC_CONFIG_HEADERS([config.h])
AM_INIT_AUTOMAKE
AC_PROG_CC
AC_PATH_XTRA
PKG_CHECK_MODULES([libutf8proc], [libutf8proc])

dnl iconv: the header in effect at build time may map iconv_open() to
dnl libiconv_open() (as libiconv does on FreeBSD), in which case -liconv is
dnl required. Do not AC_SEARCH_LIBS for a symbol name: probe the real
dnl compile and link environment, including the include paths the build uses,
dnl so the check sees the same iconv.h as main.c does.
AC_CACHE_CHECK([for iconv link requirements], [wmctrl_cv_iconv_libs], [
    wmctrl_save_LIBS="$LIBS"
    wmctrl_save_CPPFLAGS="$CPPFLAGS"
    CPPFLAGS="$CPPFLAGS $X_CFLAGS $libutf8proc_CFLAGS"
    AC_LINK_IFELSE(
        [AC_LANG_PROGRAM([[#include <iconv.h>]],
            [[iconv_t cd = iconv_open("UTF-8", "UTF-8");
              if (cd != (iconv_t)-1) iconv_close(cd);]])],
        [wmctrl_cv_iconv_libs="none required"],
        [LIBS="-liconv $LIBS"
         AC_LINK_IFELSE(
            [AC_LANG_PROGRAM([[#include <iconv.h>]],
                [[iconv_t cd = iconv_open("UTF-8", "UTF-8");
                  if (cd != (iconv_t)-1) iconv_close(cd);]])],
            [wmctrl_cv_iconv_libs="-liconv"],
            [wmctrl_cv_iconv_libs="no"])])
    LIBS="$wmctrl_save_LIBS"
    CPPFLAGS="$wmctrl_save_CPPFLAGS"
])
AS_IF([test "x$wmctrl_cv_iconv_libs" = "xno"],
      [AC_MSG_ERROR([iconv not found; install libiconv])],
      [AS_IF([test "x$wmctrl_cv_iconv_libs" != "xnone required"],
             [LIBS="$wmctrl_cv_iconv_libs $LIBS"])])

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
