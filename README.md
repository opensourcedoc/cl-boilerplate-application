# cl-boilerplate-application

Common Lisp boilerplate to build an application.

## System Requirements

### Common Lisp Implementation

One of the following Common Lisp implementations:

* [SBCL (Steel Bank Common Lisp)](http://www.sbcl.org/)
* [Clozure Common Lisp](https://ccl.clozure.com/)
* [CLISP](https://clisp.sourceforge.io/)
* [Embeddable Common Lisp](https://ecl.common-lisp.dev/)
* [ABCL (Armed Bear Common Lisp)](https://armedbear.common-lisp.dev/)

Among those implementations, SBCL is recommended for Lisp newcomers.

### Third-Party Library

[cl-portable](https://github.com/cwchentw/cl-portable) is used for portable code.

## Synopsis

### Interpretation Mode

```shell
$ abcl main.lisp
Hello World
```

### Compilation Mode

```shell
$ sbclrun main.lisp
$ ./program
Hello World
```

## Copyright

Copyright (c) 2022 Michelle Chen. Licensed under MIT
