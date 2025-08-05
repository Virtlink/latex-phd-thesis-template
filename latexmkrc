# latexmkrc
# =========
# https://www.mankier.com/1/latexmk

# Source files
$ENV{"BIBINPUTS"} = "src/::";
$ENV{"BSTINPUTS"} = "src/::";
$ENV{"TEXINPUTS"} = "./:src/:lib/::";

$bibtex_use = 2;        # Update BBL files when needed, delete BBL files on cleanup

# Output files
$emulate_aux = 1;       # Emulate the aux directory on TeXLive when $aux_dir and $out_dir are different
$aux_dir = "build";     # Directory for auxiliary files
$out_dir = ".";         # Directory for output files

$pdf_mode = 5;          # Use xelatex for PDF output
$postscript_mode = 0;   # Don't generate a PostScript version of the document
$dvi_mode = 0;          # Don't generate a DVI version of the document

# Generate glossaries (https://tex.stackexchange.com/a/44316/108670)
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
    my ($base_name, $path) = fileparse( $_[0] );
    pushd $path;

    if ( $silent ) { system "makeglossaries -q '$base_name'"; }
    else           { system "makeglossaries '$base_name'"; };

    popd;
}

# Cleanup glossary files correctly
push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'glo-abr', 'gls-abr', 'glg-abr';
push @generated_exts, 'acn', 'acr', 'alg';
$clean_ext .= '%R.ist %R.xdy';

# Command-line for XeLaTeX
# -no-pdf: https://tex.stackexchange.com/a/408789/108670
$xelatex = "xelatex -file-line-error -interaction=nonstopmode -synctex=1 -no-pdf %O %S";
