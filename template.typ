#import "@preview/showybox:2.0.4": showybox
#import "@preview/cetz:0.3.4"
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#import "@preview/theorion:0.3.3": *
#import cosmos.clouds: *
#import "@preview/lilaq:0.6.0"
#import "@preview/gentle-clues:1.3.1": *
#import "@preview/fontawesome:0.6.0": *

#let author = "ShangJhe Li"
#let doc-name = "Book Template"

#let latin-font = "Libertinus Serif"
// #let latex-font = "CMU serif"
#let mono-font = "SauceCodePro NFM"
// #let mandrin-font = "Source Han Serif"
#let mandrin-font = "AR PL KaitiM Big5"

#let references(names: array) = {
  let heading = "References/Discussion: "
  align(left, text(11pt)[
    #if names.len() == 1 {
      [#heading #names.at(0)]
    } else {
      [
        #heading
        #for name in names {
          [- #name]
        }
      ]
    }
  ])
}

// Clue Setting
#let tip(title: "Tip", ..args) = clue(icon: fa-lightbulb(), title: title, border-color: yellow, accent-color: yellow, ..args)

#let code(title: "Code", ..args) = clue(icon: fa-code(), title: title, border-color: rgb("#7287fd"), accent-color: rgb("#7287fd"), ..args)

#let warning(title: "Warning", ..args) = clue(icon: fa-warning(), title: title, border-color: rgb("#ffb639"), accent-color: rgb("#ffb639"), ..args)

#let tasks(title: "Tasks", ..args) = clue(icon: fa-tasks(), title: title, border-color: rgb("#9774ff"), accent-color: rgb("#9774ff"), ..args)

#let note(title: "Note", ..args) = clue(icon: fa-note-sticky(), title: title, border-color: rgb("#26e1d1"), accent-color: rgb("#26e1d1"), ..args)

#let file-tree(title: "Directory Structure", content, ..args) = clue(icon: fa-folder-tree(), title: title, border-color: rgb("#73d24b"), accent-color: rgb("#73d24b"), [#no-codly[#content]], ..args)

#let instruction(title: "Instruction", ..args) = clue(icon: fa-terminal(), title: title, border-color: rgb("#e04689"), accent-color: rgb("#e04689"), ..args)

// Code Reference
#let code-ref(path: str, lang: str, caption: "") = {
  let code_raw = read(path, encoding: "utf8")
  code(title: if caption != "" { caption } else { path })[
    #codly(
      stroke: .5pt + black,
      radius: 0.3em,
      inset: 0.4em,
    )
    #align(center)[
      #block()[
        #raw(code_raw, lang: lang, block: true)
      ]
    ]
  ]
}

#let title() = {
  align(center, text(24pt)[
    * #doc-name *
    #align(center, text(12pt)[
      * Author: #author * \
      * Date: #datetime.today().display() * \
    ])
  ])
}

#let conf(doc) = [
  #show: codly-init.with()
  #codly(languages: codly-languages)
  
  #show: show-theorion

  #set page(
    paper: "a4",
    margin: (x: 2cm, y: 2.5cm),
    numbering: "1",
    header: [
      _ #doc-name _
      #h(1fr)
      
      #box(fill: black, width: 100%, height: 1pt)  // Top bar
    ],
    footer: context [
      #box(fill: black, width: 100%, height: 1pt)
      #author
      #h(1fr)
      #counter(page).display("1")
    ],
  )
  
  #set text(
    font: (
      latin-font,
      mandrin-font,
      // mandrin-kaiti_font,
    ),
    size: 12pt,
    cjk-latin-spacing: auto,
  )
  
  #set par(justify: true)
  #set heading(numbering: (..nums) => nums.pos().map(str).join(".") + " ")
  #set list(indent: 1em)
  #set enum(indent: 1em)

  #show raw: set text(font: mono-font)
  
  #doc
]