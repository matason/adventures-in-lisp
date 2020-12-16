(defpackage #:basiccircularturingmachine
  (:use #:cl))

(in-package #:basiccircularturingmachine)

;;;; A basic circular Turing machine that will produce the series of numbers
;;;; 010101...

;; The length of the tape in squares. A value of 8 will allow this machine to
;; run through its configurations (of which there are 4) twice and will result
;; in a tape consisting of 4 f-squares and 4 e-squares.
(defvar tape-squares 8)

;; A vector to represent the tape, each element represents a square with the
;; content of each square being a symbol.
(defvar *tape*)
(setf *tape* (make-array tape-squares :initial-element nil :adjustable t :fill-pointer 0))

;; It is necessary to rewind the tape with (L) after printing because the Lisp
;; function vector-push-extend encompasses two operations that Turing specifies
;; separately: printing and moving. vector-push-extend writes the element to the
;; vector and then advances the fill-pointer which effectively means a (P
;; symbol) is followed by an unwanted (R). (L) is otherwise unused in this basic
;; machine.
(defun P (symbol)
  "Print the symbol on the tape."
  (vector-push-extend symbol *tape*)
  (L))

(defun R ()
  "Increment the fill-pointer to represent the action of moving along the tape to the right."
  (incf (fill-pointer *tape*)))

(defun L ()
  "Decrement the fill-pointer to represent the action of moving along the tape to the left."
  (decf (fill-pointer *tape*)))

;; Configuration struct.
(defstruct config
  (symbol nil)
  (operations nil)
  (final nil))

;; Machine configuration. Each hash table entry is a configuration for a single
;; move of the machine. The final config identifies the configuration for the
;; next move of the machine.
(defparameter *m-config* (make-hash-table))
(setf (gethash 'b *m-config*) (make-config :symbol nil :operations '((P 0) (R)) :final 'c))
(setf (gethash 'c *m-config*) (make-config :symbol nil :operations '((R)) :final 'e))
(setf (gethash 'e *m-config*) (make-config :symbol nil :operations '((P 1) (R)) :final 'f))
(setf (gethash 'f *m-config*) (make-config :symbol nil :operations '((R)) :final 'b))

;; Start the machine with configuration b. Each move applies the operations of
;; the active configuration successively to the machine. What is missing below
;; is the conditional selection of operations and final config based on the
;; scanned symbol which facilitates more advanced machine configurations and
;; outcomes.
(defvar active-configuration 'b)
(dotimes (n tape-squares)
  (setf loaded-configuration (gethash active-configuration *m-config*))
  (setf operations (config-operations loaded-configuration))

  (dolist (operation operations)
    (eval operation))

  (setf active-configuration (config-final loaded-configuration)))

(write *tape*)
