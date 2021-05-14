
# LIONSIMBA - Lithium-ION SIMulation BAttery Toolbox

<img style="float:right" height="330px" src="https://i.ibb.co/1QhBgF3/logo.png" alt="Sublime's custom image"/>

 A Matlab framework based on a finite volume model suitable for Li-ion battery design, simulation, and control

<br>

## Official Web Page

Connect to the official web page to get the latest news

[http://sisdin.unipv.it/labsisdin/lionsimba.php](http://sisdin.unipv.it/labsisdin/lionsimba.php)

-----------------------------------------------------------------
## Installation, and requirements

Please refer to the [Wiki](https://github.com/lionsimbatoolbox/LIONSIMBA/wiki) of this project for information about installation and requirements.

-----------------------------------------------------------------
## Authors

+ [Marcello Torchio](mailto:marcello.torchio01@ateneopv.it)
+ [Lalo Magni](http://sisdin.unipv.it/labsisdin/people/maglal/maglal.php)
+ [Bhushan R. Gopaluni](http://www.chbe.ubc.ca/profile/bhushan-gopaluni/)
+ [Richard D.Braatz](https://cheme.mit.edu/profile/richard-d-braatz/)
+ [Davide M. Raimondo](http://sisdin.unipv.it/labsisdin/raimondo/raimondo.php)

## Contributors to LIONSIMBA 2.0 besides the previous authors
+ [Ian Campbell](http://www.imperial.ac.uk/electrochem-sci-eng/people/)
+ [Krishnakumar Gopalakrishnan](https://www.edx.org/bio/krishnakumar-gopalakrishnan)
+ [Gregory Offer](https://www.imperial.ac.uk/people/gregory.offer)


## Acknowledgments

+ [Andrea Pozzi](https://scholar.google.com/citations?user=RLCmMM8AAAAJ) for his extensive support for LIONSIMBA 2.0 beta testing and continous support
+ **Alessio Stefanini** for his contribution to the maintenance of the LIONSIMBA 2.0 user's guide
-----------------------------------------------------------------
## Citations

If LIONSIMBA Toolbox is used for research purposes, the authors would like to have it mentioned. Here below the necessary information can be found
+ **Title:** LIONSIMBA: A Matlab framework based on a finite volume model suitable for Li-ion battery design, simulation, and control

+ **Journal:** The Electrochemical Society

+ **Volume:** 163

+ **Number:** 7

+ **Pages:** A1192-A1205

+ **Year:** 2016

##### **Download here the [BibTeX](http://sisdin.unipv.it/labsisdin/mtorchio/lionsimba.bib) file**

##### **Read the Journal paper** [here](https://web.mit.edu/braatzgroup/Torchio_JElectSoc_2016.pdf)

### Typos

The equation for the ionic flux reported in Table I and Table III has a typo in the formulation. Indeed the version on the paper reports the Faraday's constant (F) at the denominator, while the universal gas constat at the numerator. This should be inverted. The correct equation is:
<img src="https://render.githubusercontent.com/render/math?math=j_{\textrm{int}}(x,t) = 2 \frac{i_{0,\textrm{int}}}{F} \sinh \left[\frac{0.5 F}{\textrm{R} T(x,t)} \eta_{\textrm{int}}\right],">

Thanks to [sarasyha](https://github.com/sarasyha) for pointing it out in [Issue#11](https://github.com/lionsimbatoolbox/LIONSIMBA/issues/11)

-----------------------------------------------------------------

## How to start using LIONSIMBA

You can get LIONSIMBA in two ways:

### 1 - Download the latest version in zip format

 Download the latest zip package from [HERE](https://github.com/lionsimbatoolbox/LIONSIMBA/archive/master.zip)

### 2 - Clone the repository
 ```sh
$ git clone https://github.com/lionsimbatoolbox/LIONSIMBA.git
```
## Bugs report

Please feel free to use the 'issue' section on GitHub or write to

davide (**dot**) raimondo (**at**) unipv (**dot**) it

## Forks
Feel free to fork the project and modify at your best convenienve. The framework is continously under development, and contributions through push requests are welcome.

-----------------------------------------------------------------

## Changelog

### Last Update 01/19/2020 - V 2.1 Released (Now supports Octave)
**Major changes**
+ Fixed bug in the analytical initialisation of the model equations that was not allowing simulations with ageing (issue#6, thanks to mariapaygani for spotting it)
+ Implemented functions to support execution in Octave

### Last Update 04/02/2018 - V 2.0 Released
**Major changes**
+ Constant and variable profile power input mode added
+ Analytical initialisation of the model equations
+ Added thermal lumped model
+ Added stoichiometry indices for SOC calculation
+ Added possibility to initialize cell SOC through Parameters_init call
+ Added solid phase diffusion scheme based on spectral methods (provides proper results, but still in beta version)


**Minor changes**
+ General code review, polishing and variable renaming
+ Added possibility to chose the interpolation scheme at the control volumes edges
+ Normalized the finite-difference numerical scheme for the solid phase diffusion (it reduces numerical inaccuracies)

**Known bugs/issues**
+ Thermal diffusivities are different when considering thermal enabled or isothermal scenario
+ SOC initialization through initial cell (dis)charge and through Parameters_init leads to different results due to numerical inaccuracies

### Last Update 06/24/2017 - V 1.024 Released

+ Feedback-based custom current profile
+ New examples
+ Handling of input current discontinuities
+ Minor changes


### Last Update 04/04/2017

+ Minor fixes and bug corrections (thanks to Jeesoon Choi for pointing the bugs out)

### Last Update 01/03/2017 - V 1.023 Released

+ The code has been reorganized and some functions have been modularized for a better maintenance.
+ Added support in the user's guide for the installation and configuration of the SUNDIALS Matlab interface.

### Last Update 09/23/2016 - V 1.022 Released

+ Added support for analytical Jacobian. LIONSIMBA is now able to derive automatically the analytical form of the Jacobian describing the P2D dynamics. This knowledge is the exploited from the integration process to speed up the resolution of the DAEs. (Thanks to Dr. Sergio Lucia and Prof. Rolf Findeisen for pointing us out the automatic differentiation provided by [CasADi](https://github.com/casadi/casadi/wiki) toolbox)
+ Minor fixes in the examples.

### 08/27/2016

+ Fixed bug in multicell simulation (Thanks to Chintan Pathak for pointing out the bug)

### V 1.021b
+ Fixed SOC calculation bug for Fick's diffusion
+ Minor fixes
