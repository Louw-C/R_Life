#hrbrthemes - make pretty graphs
#wesanderson - for pretty colour schemes
#chrome-extension://efaidnbmnnnibpcajpcglclefindmkaj/https://cran.r-project.org/web/packages/hrbrthemes/hrbrthemes.pdf
#https://rforpoliticalscience.com/2020/07/26/make-wes-anderson-themed-graphs-with-wesanderson-package-in-r/

require(wesanderson)
require(hrbrthemes)

#use with ggplot (add as a +)

#hrbrthemes::theme_ipsum_rc(axis_title_just="center", axis_title_size=12) + 
#scale_color_manual(values= wes_palette("FantasticFox1", n = 3))

#Also! If you want to specify a package - package name::

##Another colour palette - colour of whales

library(devtools)
devtools::install_github("dawnbarlow/musculusColors")
library(musculusColors)
names(Bm_palettes)
#Example code
ggplot(data.frame(x = rnorm(1e4), y = rnorm(1e4)), aes(x = x, y = y)) +
  geom_hex() +
  coord_fixed() +
  scale_fill_gradientn(colours = musculus_palette("Bmlunge", n=50)) +
  theme_classic()