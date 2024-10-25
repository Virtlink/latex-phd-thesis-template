# latexmkrc
# =========
# https://www.mankier.com/1/latexmk

$bibtex_use = 2;        # Update BBL files when needed, delete BBL files on cleanup

$pdf_mode = 5;          
$postscript_mode = 0;   # Don't generate a PostScript version of the document
$dvi_mode = 0;          # Don't generate a DVI version of the document

# Source files and where to find them
$ENV{"BIBINPUTS"} = "src/::";
$ENV{"BSTINPUTS"} = "src/::";
$ENV{"TEXINPUTS"} = "./:src/:lib/::";

# Cleanup glossary files correctly
push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
$clean_ext .= '%R.ist %R.xdy';

# Command-line for XeLaTeX
# -no-pdf: https://tex.stackexchange.com/a/408789/108670
$xelatex = "xelatex -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1 -no-pdf %O %S";
