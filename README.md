This is a very quick and dirty way of generating an image of a Julia set given a value c (where c is a complex number). The file takes three inputs, in order: 

* `c`: The julia set's constant. A complex number with magnitude at most 2. 
* `resolution`: The output image's side-length in pixels. (The function produces a resolution*resulution Image). MUST BE AN INTEGER!
* `squareSamples`: Square root of the samples taken for each pixel in the image. (A value of 3 means that 9 samples will be taken for each pixel). MUST BE AN INTEGER!

Also, quick disclaimer, this was made for fun. It's not very efficient or elegant and will take a couple of seconds to run. Also, changing squareSamples to a number above 2 drastically increases render time for a given resolution! (I made a 2K wallpaper using 9 samples per pixel (squareSamples = 3), and it took about 2 minutes to finish on my laptop).

 

Here's the call I reccomend to test it out: `>> imshow(JuliaSet(0.38+0.32i, 1000, 1))`
