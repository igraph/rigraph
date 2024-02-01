
<!-- badges: start -->
![R-CMD-check](https://github.com/igraph/rigraph/workflows/R-CMD-check/badge.svg)
![CRAN Downloads](https://cranlogs.r-pkg.org/badges/igraph)
[![Codecov test coverage](https://codecov.io/gh/igraph/rigraph/branch/main/graph/badge.svg)](https://app.codecov.io/gh/igraph/rigraph?branch=main)
<!-- badges: end -->

# R/igraph

R/igraph is an R package of the igraph network analysis library.

## Installation

You can install the stable version of R/igraph from CRAN:

```r
install.packages("igraph")
```

For the development version, you can use R-universe

```r
options(
  repos = c(
    igraph = 'https://igraph.r-universe.dev',
    CRAN = 'https://cloud.r-project.org'
  )
)
install.packages('igraph')
```

or Github, with the `devtools` package:

```r
devtools::install_github("igraph/rigraph")
```

When compiling from sources, make sure that you have C, C++ and Fortran
compilers, as well as development packages for `glpk`, `gmp` and `libxml2`.
On Debian/Ubuntu, use `apt install libglpk-dev libgmp-dev libxml2-dev`.
On Fedora, use `yum install glpk-devel gmp-devel libxml2-devel`.

For installation from source on Windows, you need to have
[RTools](https://cran.r-project.org/bin/windows/Rtools/) installed.
For versions R >= 4.0 you can install the dependencies using:

```
pacman -Sy mingw-w64-{i686,x86_64}-glpk mingw-w64-{i686,x86_64}-gmp mingw-w64-{i686,x86_64}-libxml2
```

## Installation troubleshooting

See the [Installation FAQ](https://r.igraph.org/articles/installation-troubleshooting).

## Documentation

See the [igraph package's website](https://r.igraph.org/) for the complete manual.

## Contributions

Please read our
[contribution guide](https://github.com/igraph/rigraph/blob/dev/CONTRIBUTING.md).

## License

GNU GPL version 2 or later

## Contributors


<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->
<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->

All contributions to this project are gratefully acknowledged using the [`allcontributors` package](https://github.com/ropenscilabs/allcontributors) following the [all-contributors](https://allcontributors.org) specification. Contributions of any kind are welcome!

<table>

<tr>
<td align="center">
<a href="https://github.com/gaborcsardi">
<img src="https://avatars.githubusercontent.com/u/660288?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=gaborcsardi">gaborcsardi</a>
</td>
<td align="center">
<a href="https://github.com/ntamas">
<img src="https://avatars.githubusercontent.com/u/195637?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=ntamas">ntamas</a>
</td>
<td align="center">
<a href="https://github.com/vtraag">
<img src="https://avatars.githubusercontent.com/u/6057804?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=vtraag">vtraag</a>
</td>
<td align="center">
<a href="https://github.com/szhorvat">
<img src="https://avatars.githubusercontent.com/u/1212871?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=szhorvat">szhorvat</a>
</td>
<td align="center">
<a href="https://github.com/krlmlr">
<img src="https://avatars.githubusercontent.com/u/1741643?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=krlmlr">krlmlr</a>
</td>
<td align="center">
<a href="https://github.com/adalisan">
<img src="https://avatars.githubusercontent.com/u/1790714?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=adalisan">adalisan</a>
</td>
<td align="center">
<a href="https://github.com/igraph">
<img src="https://avatars.githubusercontent.com/u/8360597?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=igraph">igraph</a>
</td>
</tr>


<tr>
<td align="center">
<a href="https://github.com/pupamanyu">
<img src="https://avatars.githubusercontent.com/u/1937416?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=pupamanyu">pupamanyu</a>
</td>
<td align="center">
<a href="https://github.com/Antonov548">
<img src="https://avatars.githubusercontent.com/u/22891541?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=Antonov548">Antonov548</a>
</td>
<td align="center">
<a href="https://github.com/dmurdoch">
<img src="https://avatars.githubusercontent.com/u/1935680?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=dmurdoch">dmurdoch</a>
</td>
<td align="center">
<a href="https://github.com/clpippel">
<img src="https://avatars.githubusercontent.com/u/9609214?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=clpippel">clpippel</a>
</td>
<td align="center">
<a href="https://github.com/dougmet">
<img src="https://avatars.githubusercontent.com/u/5878305?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=dougmet">dougmet</a>
</td>
<td align="center">
<a href="https://github.com/wael-sadek">
<img src="https://avatars.githubusercontent.com/u/42678896?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=wael-sadek">wael-sadek</a>
</td>
<td align="center">
<a href="https://github.com/kasterma">
<img src="https://avatars.githubusercontent.com/u/421437?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=kasterma">kasterma</a>
</td>
</tr>


<tr>
<td align="center">
<a href="https://github.com/cfhammill">
<img src="https://avatars.githubusercontent.com/u/7467038?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=cfhammill">cfhammill</a>
</td>
<td align="center">
<a href="https://github.com/clhunsen">
<img src="https://avatars.githubusercontent.com/u/2649820?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=clhunsen">clhunsen</a>
</td>
<td align="center">
<a href="https://github.com/rundel">
<img src="https://avatars.githubusercontent.com/u/273926?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=rundel">rundel</a>
</td>
<td align="center">
<a href="https://github.com/qsz13">
<img src="https://avatars.githubusercontent.com/u/4075761?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=qsz13">qsz13</a>
</td>
<td align="center">
<a href="https://github.com/DexGroves">
<img src="https://avatars.githubusercontent.com/u/10374782?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=DexGroves">DexGroves</a>
</td>
<td align="center">
<a href="https://github.com/QuLogic">
<img src="https://avatars.githubusercontent.com/u/302469?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=QuLogic">QuLogic</a>
</td>
<td align="center">
<a href="https://github.com/dalloliogm">
<img src="https://avatars.githubusercontent.com/u/14500?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=dalloliogm">dalloliogm</a>
</td>
</tr>


<tr>
<td align="center">
<a href="https://github.com/Hosseinazari">
<img src="https://avatars.githubusercontent.com/u/971459?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=Hosseinazari">Hosseinazari</a>
</td>
<td align="center">
<a href="https://github.com/hclimente">
<img src="https://avatars.githubusercontent.com/u/5196281?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=hclimente">hclimente</a>
</td>
<td align="center">
<a href="https://github.com/jooolia">
<img src="https://avatars.githubusercontent.com/u/1899722?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=jooolia">jooolia</a>
</td>
<td align="center">
<a href="https://github.com/MajoroMask">
<img src="https://avatars.githubusercontent.com/u/19700954?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=MajoroMask">MajoroMask</a>
</td>
<td align="center">
<a href="https://github.com/MatthieuStigler">
<img src="https://avatars.githubusercontent.com/u/108840?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=MatthieuStigler">MatthieuStigler</a>
</td>
<td align="center">
<a href="https://github.com/mhils">
<img src="https://avatars.githubusercontent.com/u/1019198?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=mhils">mhils</a>
</td>
<td align="center">
<a href="https://github.com/das-intensity">
<img src="https://avatars.githubusercontent.com/u/12521554?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=das-intensity">das-intensity</a>
</td>
</tr>


<tr>
<td align="center">
<a href="https://github.com/peranti">
<img src="https://avatars.githubusercontent.com/u/9472741?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=peranti">peranti</a>
</td>
<td align="center">
<a href="https://github.com/RahulHP">
<img src="https://avatars.githubusercontent.com/u/4871132?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=RahulHP">RahulHP</a>
</td>
<td align="center">
<a href="https://github.com/raulzr">
<img src="https://avatars.githubusercontent.com/u/13007941?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=raulzr">raulzr</a>
</td>
<td align="center">
<a href="https://github.com/richardfergie">
<img src="https://avatars.githubusercontent.com/u/2488905?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=richardfergie">richardfergie</a>
</td>
<td align="center">
<a href="https://github.com/zeehio">
<img src="https://avatars.githubusercontent.com/u/75441?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=zeehio">zeehio</a>
</td>
<td align="center">
<a href="https://github.com/simoncarrignon">
<img src="https://avatars.githubusercontent.com/u/4749455?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=simoncarrignon">simoncarrignon</a>
</td>
<td align="center">
<a href="https://github.com/smoe">
<img src="https://avatars.githubusercontent.com/u/207407?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=smoe">smoe</a>
</td>
</tr>


<tr>
<td align="center">
<a href="https://github.com/covoes">
<img src="https://avatars.githubusercontent.com/u/4109501?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=covoes">covoes</a>
</td>
<td align="center">
<a href="https://github.com/mirca">
<img src="https://avatars.githubusercontent.com/u/13077051?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=mirca">mirca</a>
</td>
<td align="center">
<a href="https://github.com/adriandiazlab">
<img src="https://avatars.githubusercontent.com/u/50892826?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=adriandiazlab">adriandiazlab</a>
</td>
<td align="center">
<a href="https://github.com/aleszib">
<img src="https://avatars.githubusercontent.com/u/9567948?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=aleszib">aleszib</a>
</td>
<td align="center">
<a href="https://github.com/cynthiahqy">
<img src="https://avatars.githubusercontent.com/u/29718979?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=cynthiahqy">cynthiahqy</a>
</td>
<td align="center">
<a href="https://github.com/etheleon">
<img src="https://avatars.githubusercontent.com/u/2868858?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=etheleon">etheleon</a>
</td>
<td align="center">
<a href="https://github.com/stnava">
<img src="https://avatars.githubusercontent.com/u/324222?v=4" width="100px;" alt=""/>
</a><br>
<a href="https://github.com/igraph/rigraph/commits?author=stnava">stnava</a>
</td>
</tr>

</table>

<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->
<!-- ALL-CONTRIBUTORS-LIST:END -->

