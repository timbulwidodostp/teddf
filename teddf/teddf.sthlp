{smcl}
{* *! version 0.3  20 Apr 2021}{...}
{cmd:help teddf}{right: ({browse "https://doi.org/10.1177/1536867X221083886":SJ22-1: st0665})}
{hline}

{title:Title}

{p2colset 5 14 16 2}{...}
{p2col :{cmd:teddf} {hline 2}}Directional distance function (DDF) with undesirable outputs for efficiency measurement{p_end}
{p2colreset}{...}


{title:Syntax}

{p 8 13 2}
{cmd:teddf} {it:{help varlist:inputvars}} {cmd:=} {it:{help varlist:desirable_outputvars}}{cmd::} {it:{help varlist:undesirable_outputvars}} {ifin}{cmd:,} {cmdab:d:mu(}{varname}{cmd:)} [{it:options}]

{synoptset 28 tabbed}{...}
{synopthdr}
{synoptline}
{p2coldent:* {opt d:mu(varname)}}specify names of decision-making units{p_end}
{synopt:{opt t:ime(varname)}}specify the time variable for panel data{p_end}
{synopt:{opt gx(varlist)}}specify direction components for input adjustment;
order of variables should be same as in
{it:{help varlist:inputvars}}; by default, {cmd:gx()} takes the opposite of 
{it:{help varlist:inputvars}} (negative one times {it:inputvars}){p_end}
{synopt:{opt gy(varlist)}}specify direction components for desirable output
adjustment; order of variables should be same as in
{it:{help varlist:desirable_outputvars}}; by default, {cmd:gy()} takes 
{it:{help varlist:desirable_outputvars}} (with no alteration){p_end}
{synopt:{opt gb(varlist)}}specify direction components for undesirable output
adjustment; order of variables should be same as in
{it:{help varlist:undesirable_outputvars}}; by default, {cmd:gb()} takes the opposite of 
{it:{help varlist:undesirable_outputvars}} (negative one times {it:undesirable_outputvars}){p_end}
{synopt:{cmdab:nonr:adial}}use nonradial DDF{p_end}
{synopt:{opt w:mat(name)}}specify weight matrix for adjustment of input
and output variables; default is W=(1,...,1); can be used only when {cmd:nonradial} is also specified{p_end}
{synopt:{opt vrs}}specify production technology with variable returns to
scale; default is constant returns to scale{p_end}
{synopt:{opt rf(varname)}}specify indicator variable that defines which data points of outputs and inputs form the technology reference set{p_end}
{synopt:{cmdab:win:dow(#)}}use window production technology with the
{it:#}-period bandwidth{p_end}
{synopt:{cmdab:bi:ennial}}use biennial production technology{p_end}
{synopt:{cmdab:seq:uential}}use sequential production technology{p_end}
{synopt:{cmdab:glo:bal}}use global production technology{p_end}
{synopt:{opt brep(#)}}specify number of bootstrap replications; default is
{cmd:brep(0)} specifying to perform estimator without bootstrap;
bootstrap data
envelopment analysis methods typically require 1,000 or more replications{p_end}
{synopt:{opt alpha(real)}}set size of subsample bootstrap; 
default is {cmd:alpha(0.7)} indicating to subsample N^{0.7} observations out of N original reference observations{p_end}
{synopt:{opt tol(real)}}specify convergence-criterion tolerance for
{cmd:LinearProgram()}; must be integer greater than 0; default is {cmd:tol(1e-8)}{p_end}
{synopt:{opt maxiter(#)}}specify maximum number of iterations for
{cmd:LinearProgram()}; must
be integer greater than 0; default is {cmd:maxiter(16000)}{p_end}
{synopt:{cmdab:sav:ing(}{it:filename}[{cmd:, replace}]{cmd:)}}specify 
{it:filename} in which to store results{p_end}
{synopt:{opt frame(framename)}}specify {it:framename} in which to store results{p_end}
{synopt:{opt nodots}}suppress iteration dots{p_end}
{synopt:{opt noprint}}suppress display of results{p_end}
{synopt:{opt noch:eck}}suppress checking for new version; you can use this
opton to save time when an Internet connection is unavailable{p_end}
{synoptline}
{p2colreset}{...}
{p 4 6 2}
* {cmd:dmu()} is required.{p_end}


{title:Description}

{pstd}
{cmd:teddf} selects the input and output variables in the opened dataset and
solves DDF models by using the options specified.

{pstd}
The {cmd:teddf} program uses the built-in Mata function {cmd:LinearProgram()}.
Stata 16 or later is required.

{pstd}
The {cmd:teddf} program requires an initial dataset that contains the input
and output variables for observed units.

{pstd}
Variable names must be identified by {it:inputvars} for the input variables,
by {it:desirable_outputvars} for the desirable output variables, and by
{it:undesirable_outputvars} for the undesirable output variables, allowing the
{cmd:teddf} program to identify and handle the multiple input-output dataset.


{marker support}{...}
{title:Dependency}

{pstd}
{cmd:teddf} requires the {cmd:moremata} package (Jann 2005).  Two commands,
{cmd:_compile_mata.ado} and {cmd:_get_version.ado}, modified from Correia's
(2016) {cmd:ftools} package, are included to compile {cmd:lgtfpch.mlib}
for different Stata versions.{p_end}


{title:Examples}

{phang}{cmd:. use https://raw.githubusercontent.com/kerrydu/gtfpch/master/example_ddf}{p_end}
{phang}{cmd:. teddf labor capital energy = gdp: co2, dmu(id)}{p_end}
{phang}{cmd:. teddf labor capital energy = gdp: co2, dmu(id) time(t) nonradial saving(ddf_result)}{p_end}
{phang}{cmd:. teddf labor capital energy = gdp: co2, dmu(id) nonradial vrs saving(ddf_result, replace)}{p_end}
{phang}{cmd:. teddf labor capital energy = gdp: co2, dmu(id) time(t) sequential saving(ddf_result,replace)}


{title:Stored result}

{pstd}
{cmd:teddf} stores the following in {cmd:r()}:

{synoptset 15 tabbed}{...}
{p2col 5 15 17 2: Macros}{p_end}
{synopt:{cmd:r(file)}}{it:filename} stores results of {cmd:teddf}{p_end}


{marker references}{...}
{title:References}

{phang}
Correia, S.  2016.  ftools: Stata module to provide alternatives to common Stata
commands optimized for large datasets.  Statistical Software Components
S458213, Department of Economics, Boston College.
{browse "https://ideas.repec.org/c/boc/bocode/s458213.html"}.

{phang}
Jann, B.  2005.  moremata: Stata module (Mata) to provide various functions.
Statistical Software Components S455001, Department of Economics, Boston
College.  {browse "https://ideas.repec.org/c/boc/bocode/s455001.html"}.


{title:Authors}

{pstd}
Daoping Wang{break}
Shanghai University of Finance and Economics{break}
Shanghai, China{break}
daopingwang@live.sufe.edu.cn

{pstd}
Kerui Du{break}
Xiamen University{break}
Xiamen, China{break}
kerrydu@xmu.edu.cn

{pstd}
Ning Zhang{break}
Shandong University{break}
Jinan, China{break}
zn928@naver.com


{marker alsosee}{...}
{title:Also see}

{p 4 14 2}
Article:  {it:Stata Journal}, volume 22, number 1: {browse "https://doi.org/10.1177/1536867X221083886":st0665}{p_end}
