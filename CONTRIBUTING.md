# Contributing to System Reasoning Brain

We welcome and appreciate contributions from the community! By participating, you help make System Reasoning Brain better for everyone.

## 📋 Code of Conduct

By participating in this project, you agree to abide by our [Code of Conduct](#code-of-conduct). Please be respectful and inclusive.

## 🚀 Getting Started

### Prerequisites

- Git
- Text editor or IDE
- Basic understanding of Agent Skills Open Standard

### Setting Up

```bash
# Fork the repository
git clone https://github.com/your-username/system-reasoning-brain.git
cd system-reasoning-brain

# Create a feature branch
git checkout -b feature/your-feature-name

# Make your changes
# Test your changes

# Commit your changes
git commit -m "Add your feature"

# Push to the branch
git push origin feature/your-feature-name

# Open a Pull Request
```

## 🎯 Ways to Contribute

### 🐛 Reporting Bugs

- **Check existing issues** first to avoid duplicates
- **Include detailed information**:
  - Steps to reproduce
  - Expected behavior
  - Actual behavior
  - Environment (agent system, version, etc.)
  - Screenshots or logs if applicable

### 💡 Suggesting Features

- Open an issue with the `[feature-request]` label
- Describe:
  - The problem you're trying to solve
  - Your proposed solution
  - Use cases and benefits
  - Any alternatives you've considered

### 🔧 Pull Requests

1. **Follow the existing code style**
2. **Add tests** for new functionality
3. **Update documentation** if needed
4. **Keep commits atomic** (one logical change per commit)
5. **Write clear commit messages**

### 📚 Documentation

- Improve existing documentation
- Add examples
- Fix typos
- Translate to other languages

### 🎨 Design

- UI/UX improvements
- Logo and branding
- Visual assets

## 📁 Project Structure

```
system-reasoning-brain/
├── README.md                   # Main documentation
├── LICENSE                     # Apache 2.0 License
├── CHANGELOG.md                # Version history
├── CONTRIBUTING.md             # This file
├── .gitignore                  # Git ignore rules
└── skill/                      # Skill files
    ├── SKILL.md                # Main skill definition
    ├── references/             # Reference documents
    │   ├── intent-context-matrix.md
    │   ├── model-capabilities.md
    │   ├── reasoning-patterns-analysis.md
    │   └── reasoning-simulation.md
    ├── templates/              # Reasoning templates
    │   ├── adaptive-flows/
    │   │   └── unified-reasoning-flow.md
    │   ├── system-flows/
    │   │   ├── self-dialogue-template.md
    │   │   └── step-execution-template.md
    │   ├── tool-integration/
    │   └── thinking-types/
    │       ├── analytical.md
    │       ├── creative.md
    │       ├── critical.md
    │       ├── ethical.md
    │       ├── strategic.md
    │       └── systematic.md
    ├── assets/                 # Example flows
    │   └── system-examples.json
    └── scripts/                # Utility scripts
        └── validate-system-flow.sh
```

## 🔍 Code Style Guidelines

### Markdown

- Use consistent heading hierarchy
- Use fenced code blocks with language specification
- Wrap lines at 120 characters when possible
- Use consistent indentation (2 or 4 spaces)

### YAML/JSON

- Use consistent indentation (2 spaces)
- Alphabetize keys when possible
- Quote all strings

### Bash Scripts

- Use `#!/bin/bash` shebang
- Add `set -euo pipefail` for error handling
- Quote all variables: `"$var"`
- Use meaningful variable names

## ⚡ Testing

### Manual Testing

1. Install the skill locally
2. Test with various agent systems
3. Verify output formatting
4. Check edge cases

### Validation

```bash
# Validate skill structure
./skill/scripts/validate-system-flow.sh

# Test with different inputs
# (Add automated tests in the future)
```

## 🎓 Review Process

1. **Automated Checks**: CI/CD pipeline runs tests
2. **Maintainer Review**: At least one maintainer reviews the PR
3. **Community Feedback**: Open for community discussion
4. **Merge**: After approval, maintainer merges the PR

## 📜 Commit Messages

### Format

```
type(scope): subject

body

footer
```

### Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only changes
- `style`: Formatting, missing semicolons, etc.
- `refactor`: Code refactoring, no functional changes
- `perf`: Performance improvements
- `test`: Adding or fixing tests
- `chore`: Build process or auxiliary tool changes
- `revert`: Revert a previous commit

### Examples

```bash
# Good
git commit -m "feat(templates): add new reasoning pattern for debugging"
git commit -m "fix(references): remove model-specific constraints"
git commit -m "docs(readme): add installation instructions"

# Bad
git commit -m "fixed stuff"
git commit -m "updates"
```

## 🤝 Community

- **Join our Discord**: (future)
- **Follow on Twitter**: (future)
- **Star the repository**: ✨

## 🏆 Recognition

All meaningful contributions will be:
- Acknowledged in CHANGELOG.md
- Added to CONTRIBUTORS.md (future)
- Recognized in release notes

## 📝 Code of Conduct

### Our Pledge

We pledge to make participation in our community a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity and expression, level of experience, nationality, personal appearance, race, religion, or sexual identity and orientation.

### Our Standards

Examples of behavior that contributes to creating a positive environment include:

- Using welcoming and inclusive language
- Being respectful of differing viewpoints and experiences
- Gracefully accepting constructive criticism
- Focusing on what is best for the community
- Showing empathy towards other community members

Examples of unacceptable behavior by participants include:

- The use of sexualized language or imagery
- Trolling, insulting/derogatory comments, and personal or political attacks
- Public or private harassment
- Publishing others' private information without explicit permission
- Other conduct which could reasonably be considered inappropriate

### Our Responsibilities

Project maintainers are responsible for clarifying the standards of acceptable behavior and are expected to take appropriate and fair corrective action in response to any instances of unacceptable behavior.

### Scope

This Code of Conduct applies both within project spaces and in public spaces when an individual is representing the project or its community.

### Enforcement

Instances of abusive, harassing, or otherwise unacceptable behavior may be reported by contacting the project maintainers. All complaints will be reviewed and investigated.

Maintainers who do not follow or enforce the Code of Conduct may be permanently removed from the project team.

### Attribution

This Code of Conduct is adapted from the [Contributor Covenant](https://www.contributor-covenant.org), version 1.4.

---

## 📞 Support

For questions or issues:

1. Check the [documentation](README.md)
2. Look through [open issues](https://github.com/your-username/system-reasoning-brain/issues)
3. Open a new issue

---

**Thank you for contributing to System Reasoning Brain!** 🙏

Your contributions help make this project better for everyone.
