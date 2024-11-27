# Implementation Plan

This document details the implementation plan for the coq-waterproof-natded Coq theory. It mostly details the development process, and does not contain any technical details.

# Current Status

Currently, the coq-waterproof-natded theory is under development. I am starting to understand the workings of coq-waterproof, and am beginning to write the coq-waterproof-natded theory. I am using this repository both to develop the theory, and also document what I learn about coq-waterproof and waterproof-vscode.

# Milestones

# Milestone 1: Understand coq-waterproof
- Gain a basic understanding of the technologies underlying coq-waterproof:
    - Coq
    - Ltac2
    - OCaml
    - Dune
    - Opam
- Understand the core tactics of coq-waterproof, and how they are implemented.
- Understand the automation tactics of coq-waterproof, and how they are implemented.
- Understand the notations of coq-waterproof, and how they are implemented.

Findings are documented in [docs/design/design_document.md](design_document.md).

# Milestone 2: Write the coq-waterproof-natded theory

- Come up with natural language formulations of the rules of natural deduction.
    - both forward and backward rules
- Write the coq-waterproof-natded theory, but using natural deduction proof rules.
- For the backward rules, we can build on BenV2.v, which has tactics for the backward rules.

Findings are documented in [docs/design/design_document.md](design_document.md).
