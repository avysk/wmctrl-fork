AC_INIT([wmctrl-fork], 1.09.02)
AC_CONFIG_SRCDIR([main.c])
AM_INIT_AUTOMAKE
AC_PROG_CC
AC_PATH_XTRA
PKG_CHECK_MODULES([libutf8proc], [libutf8proc])
AC_SEARCH_LIBS([iconv_open], [iconv], [], [
    AC_SEARCH_LIBS([libiconv_open], [iconv])
])
AC_CONFIG_FILES([Makefile])
AC_OUTPUT
