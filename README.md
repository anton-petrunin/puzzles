## How to build

Building is straightforward, you will need LaTeX and Git.
The following command will create a local copy of the source code for you.

`git clone https://github.com/anton-petrunin/puzzles.git`

Go to the created folder and run `pdflatex`, `biber` and `makeindex` few times:

`cd puzzles/`<br/>
`pdflatex problems.tex`<br/>
`makeindex problems`<br/>
`biber problems`<br/>
`pdflatex problems.tex`<br/>

To get arXiv.tar with all needed files do

`tar -cvf arXiv.tar --files-from list-of-files.txt`
