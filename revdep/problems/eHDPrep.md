# eHDPrep (1.4.0)

* GitHub: <https://github.com/overton-group/eHDPrep>
* Email: <mailto:I.Overton@qub.ac.uk>
* GitHub mirror: <https://github.com/cran/eHDPrep>

Run `revdepcheck::revdep_details(, "eHDPrep")` for more info

## Newly broken

*   checking re-building of vignette outputs ... ERROR
     ```
     ...
     tlmgr: package log updated: /home/runner/.TinyTeX/texmf-var/web2c/tlmgr.log
     tlmgr: command log updated: /home/runner/.TinyTeX/texmf-var/web2c/tlmgr-commands.log
     tlmgr: package repository https://tlnet.yihui.org (verified)
     [1/1, ??:??/??:??] install: ulem [7k]
     running mktexlsr ...
     done running mktexlsr.
     tlmgr: package log updated: /home/runner/.TinyTeX/texmf-var/web2c/tlmgr.log
     tlmgr: command log updated: /home/runner/.TinyTeX/texmf-var/web2c/tlmgr-commands.log
     tlmgr: package repository https://tlnet.yihui.org (verified)
     [1/1, ??:??/??:??] install: makecell [5k]
     running mktexlsr ...
     done running mktexlsr.
     tlmgr: package log updated: /home/runner/.TinyTeX/texmf-var/web2c/tlmgr.log
     tlmgr: command log updated: /home/runner/.TinyTeX/texmf-var/web2c/tlmgr-commands.log
     ! pdflatex: fatal: Could not undump 41 1-byte item(s) from /home/runner/.TinyTeX/texmf-var/web2c/pdftex/pdflatex.fmt.
     
     Error: processing vignette 'Introduction_to_eHDPrep.Rmd' failed with diagnostics:
     LaTeX failed to compile <lib>/eHDPrep.Rcheck/vign_test/eHDPrep/vignettes/Introduction_to_eHDPrep.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See Introduction_to_eHDPrep.log for more info.
     --- failed re-building ‘Introduction_to_eHDPrep.Rmd’
     
     SUMMARY: processing the following file failed:
       ‘Introduction_to_eHDPrep.Rmd’
     
     Error: Vignette re-building failed.
     Execution halted
     ```

