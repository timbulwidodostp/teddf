{smcl}
{* *! version 1.1  21 Oct 2021}{...}
{cmd:help gtfpch}{right: ({browse "https://doi.org/10.1177/1536867X221083886":SJ22-1: st0665})}
{hline}

{title:Title}

{p2colset 5 15 17 2}{...}
{p2col :{cmd:gtfpch} {hline 2}}Total factor productivity (TFP) with undesirable
outputs{p_end}
{p2colreset}{...}


{title:Syntax}

{p 8 14 2}
{cmd:gtfpch} {it:{help varlist:inputvars}} {cmd:=} 
{it:{help varlist:desirable_outputvars}}{cmd::}
{it:{help varlist:undesirable_outputvars}} {ifin} [{cmd:,} {it:options}]

{synoptset 28 tabbed}{...}
{synopthdr}
{synoptline}
{synopt:{opt dmu(varname)}}specify names of decision-making units{p_end}
{p2coldent:* {cmdab:luen:berger}}specify to estimate Luenberger productivity
index; default is Malmquist-Luenberger productivity index based on radial
directional distance function (DDF){p_end}
{p2coldent:+ {opt ort(string)}}specify orientation; default is
{cmd:ort(}{cmdab:o:utput}{cmd:)}, the output-oriented productivity 
indicator; {cmd:ort(}{cmdab:i:nput}{cmd:)} specifies the input-oriented
productivity indicator and {cmd:ort(}{cmdab:h:ybrid}{cmd:)} specifies the hybrid productivity indicator{p_end}
{synopt:{opt gx(varlist)}}specify direction components for input adjustment;
order of variables should be same as in
{it:{help varlist:inputvars}}; by default, {cmd:gx()}=(0,...,0) for {cmd:ort(output)} and
{cmd:gx()} = -{it:inputvars} for {cmd:ort(input)} and {cmd:ort(hybrid)}{p_end}
{synopt:{opt gy(varlist)}}specify direction components for desirable output
adjustment; order of variables should be same as in
{it:{help varlist:desirable_outputvars}}; by default, {cmd:gy()}=(0,...,0) for
{cmd:ort(input)} and
{cmd:gy()} = {it:desirable_outputvars} for {cmd:ort(output)} and {cmd:ort(hybrid)}{p_end}
{synopt:{opt gb(varlist)}}specify direction components for undesirable output
adjustment; order of variables should be same as in
{it:{help varlist:undesirable_outputvars}}; by default, {cmd:gb()}=(0,...,0)
for
{cmd:ort(input)} and
{cmd:gb()} = -{it:undesirable_outputvars} for {cmd:ort(output)} and
{cmd:ort(hybrid)}{p_end}
{synopt:{cmdab:nonr:adial}}use nonradial DDF{p_end}
{synopt:{opt w:mat(name)}}specify weight matrix for adjustment of input
and output variables for the nonradial directional distance measure; can be used only when {cmd:nonradial} is also specified{p_end}
{synopt:{opt win:dow(#)}}use window production technology with the
{it:#}-period bandwidth{p_end}
{synopt:{cmdab:bi:ennial}}use biennial production technology{p_end}
{synopt:{cmdab:seq:uential}}use sequential production technology{p_end}
{synopt:{opt global}}use global production technology{p_end}
{synopt:{opt fgnz}}specify to decompose TFP change following the 
F{c a:}re et al. (1994) method{p_end}
{synopt:{opt rd}}specify to decompose TFP change following the Ray and Desli (1997) method{p_end}
{synopt:{opt tol(real)}}specify convergence-criterion tolerance for
{cmd:LinearProgram()}; must be integer greater than 0; default is {cmd:tol(1e-8)}{p_end}
{synopt:{opt maxiter(#)}}specify maximum number of iterations for
{cmd:LinearProgram()}; must be integer greater than 0; default is {cmd:maxiter(16000)}{p_end}
{synopt:{cmdab:sav:ing(}{it:filename}[{cmd:, replace}]{cmd:)}}specify 
{it:filename} in which to store results{p_end}
{synopt:{opt frame(framename)}}specify {it:framename} in which to store results{p_end}
{synopt:{opt noprint}}suppress display of results{p_end}
{synopt:{opt noch:eck}}suppress checking for new version; you can use this
opton to save time when an Internet connection is unavailable{p_end}
{synoptline}
{p2colreset}{...}
{p 4 6 2}  A panel variable and a time variable must be specified; use {helpb xtset}.{p_end}
{p 4 6 2}* The Luenberger productivity indicator is estimated when {cmd:nonradial} is specified.{p_end}
{p 4 6 2}+ {cmd:ort(hybrid)} can only be used for the Luenberger productivity indicator.{p_end}


{title:Description}

{pstd}
{cmd:gtfpch} selects the input and output variables in the opened dataset and
estimates the TFP index by using the options specified.

{pstd}
The {cmd:gtfpch} program requires an initial dataset that contains the input
and output variables for observed units.

{pstd}
Variable names must be identified by {it:inputvars} for the input variables,
by {it:desirable_outputvars} for the desirable output variables, and by
{it:undesirable_outputvars} for the undesirable output variables, allowing the
{cmd:gtfpch} program to identify and handle the multiple input-output dataset.


{marker support}{...}
{title:Dependency}

{pstd}
{cmd:gtfpch} requires the {cmd:moremata} package (Jann 2005).  Two commands,
{cmd:_compile_mata.ado} and {cmd:_get_version.ado}, modified from Correia's
(2016) {cmd:ftools} package, are included to compile {cmd:lgtfpch.mlib}
for different Stata versions.{p_end}


{title:Examples}

{phang}{cmd:. use https://raw.githubusercontent.com/kerrydu/gtfpch/master/example_ddf}{p_end}
{phang}{cmd:. xtset id t}{p_end}
{phang}{cmd:. gtfpch labor capital energy = gdp: co2, nonradial saving(ddf_result)}{p_end}
{phang}{cmd:. gtfpch labor capital energy = gdp: co2, ort(input)}{p_end}
{phang}{cmd:. gtfpch labor capital energy = gdp: co2, sequential luenberger saving(ddf_result, replace)}


{title:Stored results}

{pstd}
{cmd:gtfpch} stores the following in {cmd:r()}:

{synoptset 15 tabbed}{...}
{p2col 5 15 17 2: Macros}{p_end}
{synopt:{cmd:r(file)}}{it:filename} stores results of {cmd:gtfpch}{p_end}
{synopt:{cmd:r(frame)}}{it:framename} stores results of {cmd:gtfpch}{p_end}
{synopt:{cmd:r(weight)}}weight vector for nonradial DDF {cmd:gtfpch}{p_end}
{synopt:{cmd:r(gvec)}}directional vector {cmd:gtfpch}{p_end}


{marker references}{...}
{title:References}

{phang}
Correia, S.  2016.  ftools: Stata module to provide alternatives to common
Stata commands optimized for large datasets.  Statistical Software Components
S458213, Department of Economics, Boston College.
{browse "https://ideas.repec.org/c/boc/bocode/s458213.html"}.

{phang}
F{c a:}re, R., S. Grosskopf, M. Norris, and Z. Zhang.  1994.  Productivity
growth, technical progress, and efficiency change in industrialized countries.
{it:American Economic Review} 84: 66-83.

{phang}
Jann, B.  2005.  moremata: Stata module (Mata) to provide various functions.
Statistical Software Components S455001, Department of Economics, Boston
College.  {browse "https://ideas.repec.org/c/boc/bocode/s455001.html"}.

{phang}
Ray, S. C., and E. Desli.  1997.  Productivity growth, technical progress, and
efficiency change in industrialized countries: Comment.
{it:American Economic Review} 87: 1033-1039.


{title:Authors}

{pstd}
Daoping Wang{break}
Shanghai University of Finance and Economics{break}
Shanghai, China{break}
daopingwang@outlook.com

{pstd}
Kerui Du{break}
Xiamen University{break}
Xiamen, China{break}
kerrydu@xmu.edu.cn

{pstd}
Ning Zhang{break}
Shandong University{break}
Weihai, China{break}
zn928@naver.com


{marker alsosee}{...}
{title:Also see}

{p 4 14 2}
Article:  {it:Stata Journal}, volume 22, number 1: {browse "https://doi.org/10.1177/1536867X221083886":st0665}{p_end}
