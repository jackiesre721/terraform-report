```markdown
# terraform-report Development Patterns

> Auto-generated skill from repository analysis

## Overview
This skill teaches you the development conventions and workflows used in the `terraform-report` TypeScript codebase. You'll learn how to structure files, write imports and exports, follow commit message guidelines, and write and run tests. These patterns ensure consistency and maintainability across the project.

## Coding Conventions

### File Naming
- Use **camelCase** for file names.
  - Example: `terraformReport.ts`, `generateSummary.test.ts`

### Import Style
- Use **relative imports** for all modules.
  - Example:
    ```typescript
    import { generateSummary } from './generateSummary';
    ```

### Export Style
- Use **named exports**.
  - Example:
    ```typescript
    export function generateSummary() { ... }
    ```

### Commit Messages
- Follow **Conventional Commits** with prefixes:
  - `feat`: For new features
  - `chore`: For maintenance or non-feature changes
- Keep commit messages concise (average ~47 characters).
  - Example:
    ```
    feat: add summary generation for resources
    chore: update dependencies
    ```

## Workflows

### Commit Changes
**Trigger:** When committing code changes  
**Command:** `/commit`

1. Stage your changes:
    ```
    git add .
    ```
2. Write a commit message using the conventional format:
    ```
    git commit -m "feat: add new resource parser"
    ```
3. Push your changes:
    ```
    git push
    ```

### Add a New Module
**Trigger:** When creating a new feature or utility  
**Command:** `/add-module`

1. Create a new file using camelCase, e.g. `myFeature.ts`.
2. Implement your logic and use named exports:
    ```typescript
    export function myFeature() { ... }
    ```
3. Import the module using a relative path where needed:
    ```typescript
    import { myFeature } from './myFeature';
    ```
4. Add and commit your changes following the commit conventions.

### Write and Run Tests
**Trigger:** When adding or updating functionality  
**Command:** `/test`

1. Create a test file with `.test.` in the filename, e.g. `myFeature.test.ts`.
2. Write your tests (framework is currently unknown; follow existing patterns).
3. Run your tests using the project's test runner (consult project documentation or package.json for the exact command).

## Testing Patterns

- Test files are named with `.test.` in the filename, e.g. `generateSummary.test.ts`.
- The testing framework is not specified; follow the structure of existing test files.
- Place test files alongside the modules they test or in a dedicated test directory.

## Commands

| Command      | Purpose                                         |
|--------------|-------------------------------------------------|
| /commit      | Commit code changes using conventional messages  |
| /add-module  | Add a new module following project conventions   |
| /test        | Run the test suite                              |
```
