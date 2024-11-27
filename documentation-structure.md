# Documentation Structure

The documentation is organized into several key sections, each serving a specific purpose in the development lifecycle of the coq-waterproof-natded plugin:

### Project Overview

- **Purpose**: Provide a high-level overview of the coq-waterproof-natded plugin.
- **Contents**: Overview of the coq-waterproof-natded plugin, including its purpose, technologies used, and how it works.
- **Location**: [`project-overview.md`](project-overview.md)

### User Stories

- Purpose: Capture end-user actions, goals, reasoning, and motives to guide development.
- Contents: Each user story follows the format: "As a [user type], I want [an action] so that [a benefit]."
- Location: [`docs/user_stories.md`](docs/user_stories.md)

### Functional Requirements

- **Purpose**: Specify the functionalities the coq-waterproof-natded plugin must provide.
- **Contents**: Clear, numbered requirements describing what the system should do, such as proof construction and manipulation features.
- Location: [`docs/requirements/functional_requirements.md`](docs/requirements/functional_requirements.md)

### Design Documents

- **Purpose**:
 - Detail the design of Waterproof, the Coq library that implements natural deduction, describing what it is, what technologies it uses, and how it works.
 - Detail the design of the coq-waterproof-natded plugin, describing the system architecture, technologies used, directory structure, data structures, algorithms, etc.
- **Contents**:
  - *Waterproof Design*, which describes the components of Waterproof (`coq-waterproof` and `waterproof-vscode`).
  - *coq-waterproof-natded Design*, which describes the `coq-waterproof-natded` plugin.
- **Location**: [`docs/design/design_document.md`](docs/design/design_document.md)

### Implementation Plans

- **Purpose**: Detail how the design will be implemented. Design covers most of this, so its more about planning and organizing the development and writing processes.
- **Contents**: Milestones in developing the `coq-waterproof-natded` plugin and writing the documentation. A timeline of the development process with deadlines is planned to be added.
- **Location**: [`docs/plans/implementation_plan.md`](docs/plans/implementation_plan.md)

### Testing Plans

- **Purpose**: Define how the coq-waterproof-natded plugin will be tested to ensure quality.
- **Contents**: Test cases, testing procedures, and expected outcomes to validate the coq-waterproof-natded plugin.
- **Location**: [`docs/plans/testing_plan.md`](docs/plans/testing_plan.md)

### Guides

- **Purpose**: Provide guides for users.
- **Contents**:
  - [*Installation Guide*](docs/guides/installation_guide.md), which provides a guide for users to install the coq-waterproof-natded plugin, and the dependencies.
  - [*User Guide*](docs/guides/user_guide.md), which provides a guide for users to understand how to use the coq-waterproof-natded plugin.
- **Location**: `docs/guides/`

Possible future additions:
```
    ### Non-Functional Requirements

    - **Purpose**: Define system attributes like performance, usability, and maintainability.
    - **Contents**: Descriptions of system qualities with measurable criteria.
    - **Location**: [`docs/requirements/nonfunctional_requirements.md`](docs/requirements/nonfunctional_requirements.md)
```
For now, we will be happy if the system functions at all.

# Repository Structure

All documentation is organized within the `/docs/` directory of the repository. 
```
.
├── project-overview.md                 - Project overview and goals
├── documentation-structure.md          - Documentation structure
├── docs/
│   ├── design/
│   │   └── design_document.md          - Design of Waterproof and coq-waterproof-natded
│   ├── plans/
│   │   ├── implementation_plan.md      - Implementation milestones and timeline
│   │   └── testing_plan.md             - Testing procedures and test cases
│   ├── requirements/
│   │   └── functional_requirements.md  - Functional requirements
│   └── guides/
│       ├── installation_guide.md       - Installation instructions
│       └── user_guide.md               - Usage guide and examples
├── src/                                - OCaml source code
├── theories/                           - Coq theories
└── tests/                              - Test files
```
