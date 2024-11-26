# Design Document

This document details the design of the three components:

1. coq-waterproof - Coq library that implements natural language tactics
   - What it is and its purpose
   - Technologies used
   - How it works and its implementation details

2. waterproof-vscode - The VSCode extension that provides a user interface
   - System architecture 
   - Technologies used
   - Directory structure
   - Data structures and algorithms
   - Integration with coq-waterproof library

3. coq-waterproof-natded - Coq library that extends coq-waterproof with natural deduction tactics (our extension)
   - System architecture 
   - Technologies used
   - Directory structure
   - Data structures and algorithms
   - Integration with coq-waterproof library

The goal is to provide a technical overview of all three components and how they work together.

## 1. coq-waterproof

### Introduction
coq-waterproof is a Coq library that allows writing Coq proofs in a style that resembles non-mechanized mathematical proofs. It provides natural language tactics and notation that makes proofs readable even for mathematicians unfamiliar with Coq syntax.

### Technologies used
The library is built using:
- Coq 8.17.0 as the core proof assistant
- OCaml for plugin development
- Opam for package management
- Dune for building
- Ltac2 for tactic programming

#### Coq
Coq is a formal proof management system. It provides a formal language to write mathematical definitions, executable tactics to manipulate definitions, and a built-in tactic to check proofs.
##### Basic Concepts of Coq

Coq is both a programming language and an interactive proof assistant, built upon a rich type theory. Its primary purpose is to allow users to construct mathematical definitions, algorithms, and theorems, and to verify the correctness of these constructions through formal proofs.

Key concepts in Coq include:
-Inductive Types: Coq allows the definition of new data types using inductive definitions. These can represent mathematical structures like natural numbers, lists, trees, etc.

```coq
Inductive nat : Type :=
  | O : nat
  | S : nat -> nat.
```

- Functions and Definitions: Functions in Coq are defined using pattern matching and recursion. Coq ensures that all functions are total (they terminate on all inputs).

```coq
Fixpoint add (n m : nat) : nat :=
  match n with
  | O => m
  | S n' => S (add n' m)
  end.
```

- Theorem Proving: Theorems in Coq are stated as propositions, which are types themselves. Proving a theorem involves constructing a term of the corresponding type.

```coq
Theorem add_O_n : forall n : nat, add O n = n.
```

- Tactics: Coq provides a tactic language for interactive proof development. Tactics are commands that manipulate the proof state to gradually build a proof.

```coq
Proof.
  intros n.
  simpl.
  reflexivity.
Qed.
```

- Modules and Libraries: Coq includes a standard library of definitions and theorems. Users can organize their code using modules to manage namespaces and dependencies.

- Dependent Types: Types in Coq can depend on values, allowing for expressive specifications. This feature enables the encoding of rich mathematical structures and properties.

##### Example of a Proof in Coq

Let's consider a simple proof: proving that addition of natural numbers is commutative.

First, we define natural numbers and addition (though these are available in Coq's standard library):

```coq
Inductive nat : Type :=
  | O : nat
  | S : nat -> nat.

Fixpoint add (n m : nat) : nat :=
  match n with
  | O => m
  | S n' => S (add n' m)
  end.
```

Now, we state the theorem:

```coq
Theorem add_comm : forall n m : nat, add n m = add m n.
```

We proceed to prove it using induction on n:

```coq
Proof.
  intros n m.
  induction n as [| n' IHn'].
  - simpl.
    rewrite <- add_n_O.
    reflexivity.
  - simpl.
    rewrite IHn'.
    reflexivity.
Qed.
```

Explanation of the proof steps:

1. `intros n m`: Introduce variables n and m into the context.
2. `induction n as [| n' IHn']`: Perform induction on n. We consider two cases:
    - Base case (`n = O`): We simplify `add O m`, which gives `m`. We need to show `m = add m O`, which requires us to prove `add m O = m`. This is a standard lemma in Coq (`add_n_O`).
    - Inductive step (`n = S n'`): We assume the induction hypothesis (`IHn'`) that `add n' m = add m n'`. We then simplify `add (S n') m` to `S (add n' m)` and use the induction hypothesis to rewrite it to `S (add m n')`, which simplifies to `add m (S n')`.
3. `reflexivity`: Concludes the proof when both sides of the equation are identical.

#####Mathematical Basis of Coq

Coq is based on type theory. Specifically, it is based on the Calculus of Inductive Constructions (CIC).

Key mathematical foundations include:

- Type Theory: In Coq, types play a central role. Every term has a type, and types themselves can be manipulated as first-class citizens. This allows for a uniform treatment of programs and proofs.

- Dependent Types: Types can depend on values, enabling more precise typing. For example, one can define a vector type of length n, ensuring at the type level that operations on vectors respect their sizes.

- Curry-Howard Correspondence: Also known as the propositions-as-types principle, this correspondence establishes a deep connection between logic and computation. In Coq, propositions are types, and proofs are programs (terms) of these types.

- Inductive Definitions: Coq's ability to define inductive types and predicates allows for the construction of complex mathematical objects and the formulation of properties about them.

- Constructive Logic: Coq operates within constructive logic, where existence proofs require the explicit construction of an example. This contrasts with classical logic, where non-constructive proofs are allowed.

- Strong Normalization and Consistency: The type system of Coq is designed to ensure that all computations terminate (strong normalization). This property is crucial for the consistency of the logic, preventing paradoxes like those found in unrestricted set theories.

#### OCaml
OCaml is a statically typed, functional programming language. Coq is written in OCaml. Some parts of coq-waterproof are also written in OCaml. These can be found in the `src/` directory.
##### Filetypes relating to OCaml
- `.ml` - OCaml source code
- `.mli` - OCaml interface file
- `.mlg` - OCaml grammar file

#### Opam
Opam is a package manager for OCaml. It can be used to install `coq-waterproof` and its dependencies.
The `coq-waterproof.opam` file specifies the dependencies and metadata of `coq-waterproof`. Information includes:

- Version: 2.1.1+8.18
- Maintainer: Jim Portegies
- Authors: Jelle Wemmenhove, Balthazar Pathiachvili, Cosmin Manea, Lulof Pirée, Adrian Vrămuleţ, Tudor Voicu, and Jim Portegies
- License: LGPL-3.0-or-later
- Dependencies:
  - OCaml >= 4.09.0
  - Coq >= 8.18 and < 8.19 
  - Dune >= 3.6
- Build and installation instructions (using dune)

#### Installation with Opam
Can be found in the README.md file of the coq-waterproof repository.

#### Dune
Dune is a build system for OCaml projects. It is used to compile and link the Coq plugin.

#### Ltac2
Ltac2 is a tactic language for Coq. It is used to write tactics for coq-waterproof, and coq-waterproof-natded.
It is a successor to Ltac, which needed one due to several reasons. To quote the [Coq documentation](https://coq.inria.fr/doc/V8.18.0/refman/proof-engine/ltac2.html):
> The Ltac tactic language is probably one of the ingredients of the success of Coq, yet it is at the same time its Achilles' heel. Indeed, Ltac:
>
> - has often unclear semantics
> - is very non-uniform due to organic growth
> - lacks expressivity (data structures, combinators, types, ...)
> - is slow
> - is error-prone and fragile
> - has an intricate implementation
> Following the need of users who are developing huge projects relying critically on Ltac, we believe that we should offer a proper modern language that features at least the following:
> - at least informal, predictable semantics
> - a type system
> - standard programming facilities (e.g., datatypes)
>
> This new language, called Ltac2, is described in this chapter. It is still experimental but we nonetheless encourage users to start testing it, especially wherever an advanced tactic language is needed. The previous implementation of Ltac, described in the previous chapter, will be referred to as Ltac1.

### Features:

1. Natural Language Tactics
- Controlled natural language formulations for built-in Coq tactics
- Mathematical notation (e.g. ℝ, "A is closed")
- Enforced signposting for proof structure
- Chains of inequalities for mathematical reasoning
- These are implemented using Ltac2

2. Automation System
- Custom automation tactics (waterprove, wp_auto, wp_eauto)
- Configurable hint databases
- Better backtracking support than standard auto/eauto
- Runtime-configurable presets

3. User Support
- Help messages and detailed error messages
- Enforced proof structure through signposting
- Automation to hide unnecessary proof details

The library consists of several key modules:
- Waterproof.Waterproof: Core tactics
- Waterproof.Automation: Automation system
- Waterproof.Tactics: Additional tactics
- Waterproof.Notations: Mathematical notations

### Implementation details
The library is structured as a Coq plugin, and is built using Dune.

The `theories` directory contains the mathematical theories that are imported by the library.
`theories/dune` specifies that the directory contains a Coq theory, and that every `.v` file in the directory is a Coq file that should be imported by the theory.
`theories/` contains files 

`src/` contains OCaml source code necessary for the tactics, automation, and notations.

Declare ML Module "waterproof:coq-waterproof.databases".


## 2. waterproof-vscode
### Introduction
waterproof-vscode is a Visual Studio Code extension that provides IDE support for writing Coq proofs using the coq-waterproof library. It aims to make proof development more accessible by providing a modern, user-friendly interface.

### Technologies used
The extension is built using:
- TypeScript for the extension logic
- Node.js as the runtime environment
- Visual Studio Code Extension API
- CoqLSP for Coq interaction
- WebView API for custom UI components

### Implementation details

Key features include:

1. Proof Development Interface
- Real-time proof state visualization
- Syntax highlighting for Coq and coq-waterproof
- Code completion and snippets
- Error highlighting and diagnostics

2. Coq Integration
- CoqLSP-based communication with Coq
- Document synchronization
- Proof state management
- Goal visualization

3. User Experience Features
- Custom proof outline view
- Interactive proof navigation
- Configurable settings
- Integrated documentation

The extension follows a modular architecture:
- Extension Core: Main extension logic and activation
- Language Server: Handles Coq interaction and document processing
- UI Components: Custom views and panels
- Configuration: User settings and preferences

## 3. coq-waterproof-natded

### Introduction
coq-waterproof-natded is a Coq library that extends coq-waterproof with natural deduction tactics.

### Technologies used
The library is built using:
- Coq 8.17.0 as the core proof assistant
- OCaml for plugin development
- Opam for package management
- Dune for building
- Ltac2 for tactic programming

### Implementation details
The library is structured as a Coq plugin, and is built using Dune.

The structure of the library will be identical to that of coq-waterproof.