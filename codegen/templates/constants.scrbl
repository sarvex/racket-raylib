#lang scribble/text

@(require racket/match
          racket/format
          "../objects.rkt"
          "common.rkt")
@(provide generate-constants)

@(define (generate-constants constants-parsed)
@list{
#lang scribble/manual

@"@"(require (for-label "../../unsafe/constants.rkt" "../../unsafe/structs.rkt" racket/base))

@"@"table-of-contents[]

@"@"title{Constants}
@"@"defmodule[raylib/generated/unsafe/constants]
@splice{
@(for/list ([parsed-constant (in-list constants-parsed)])
   (match-define (api-constant name description _ _) parsed-constant)
   (define-values (type value) (constant-type-and-value parsed-constant))
   (when value
@list{@(void)
@"@"defthing[@|name| @|type| #:value @|value| @(~s (or description ""))]
@(void)}))}})