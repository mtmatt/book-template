# Book Template

A [Typst](https://typst.app/) book/notes template with pre-configured packages for diagrams, code blocks, callout boxes, math theorems, and CJK (Chinese) support.

## Requirements

- Typst 0.14.2+
- Fonts: Libertinus Serif, SauceCodePro NFM, AR PL KaitiM Big5

### Font Dependencies

On Ubuntu/Debian, install the packaged CJK font and install Libertinus/SauceCodePro from their upstream releases:

```sh
sudo apt-get update
sudo apt-get install -y curl fontconfig fonts-arphic-bkai00mp unzip
```

- Libertinus Serif: download `Libertinus-7.051.zip` from the [Libertinus releases](https://github.com/alerque/libertinus/releases) and install the `static/OTF/*.otf` files.
- SauceCodePro NFM: download `SourceCodePro.zip` from the [Nerd Fonts releases](https://github.com/ryanoasis/nerd-fonts/releases) and install the font files.

## Structure

```
.
├── main.typ                    # Entry point
├── template.typ                # Page layout, fonts, and custom components
├── ref.bib                     # Bibliography
└── chapters/
    ├── acknowledgement.typ
    └── how-to-use/
        ├── ch.typ              # Chapter entry
        ├── code.typ            # Code block examples
        └── block.typ           # Callout block examples
```

## Packages

| Package | Version | Purpose |
|---|---|---|
| showybox | 2.0.4 | Styled boxes |
| cetz | 0.3.4 | Diagrams and drawings |
| fletcher | 0.5.8 | Graph/flow diagrams |
| codly | 1.3.0 | Syntax-highlighted code blocks |
| codly-languages | 0.1.10 | Language definitions for codly |
| theorion | 0.3.3 | Theorem/proof environments |
| lilaq | 0.6.0 | Plots |
| gentle-clues | 1.3.1 | Callout boxes |
| fontawesome | 0.6.0 | Icons |

## Usage

### Setup

Edit `template.typ` to set your name and document title:

```typst
#let author = "Your Name"
#let doc-name = "Your Document Title"
```

### Adding Chapters

Include chapters in `main.typ`:

```typst
#include "chapters/your-chapter/ch.typ"
```

Each chapter file should import the template and apply the `conf` show rule:

```typst
#import "../../template.typ": *
#show: conf

= Chapter Title
```
