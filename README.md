# Github Sponsor
 
**Github Sponsor** is open source applications for generate all sponsor github to **image/png**, this open source use technology (**DART & Flutter**).

This **library create** because i'want **add github sponsor** image on **readme** all my **repositories** so, i don't use time for useless

## Technology / Framework / Depencies

1. [DART]() 
2. [FLUTTER]() Generate Image
3. [XVFB]() Run Application without gpu or monitor (on server / github action)

## Why Need Flutter

i don't have skills make image with svg / or canvas in dart, so i use flutter because flutter is very easy for make any widget and can save to image, so i don't need learn canvas for generate this image hehe 😦

## How Work

Cara program ini bekerja, pertama kami menjalankan program xvfb di dart, hal ini kami lakukan sekalian check file sponsor apakah ada / tidak jika ada akan di hapus dahulu, 

setelah berhasil jalan, applikasi automatis akan menggenerate gambar sponsor lalu mempublikasikan ke github repo setelah itu maka program akan automatis berhenti

## Environment

| Name               | Example Value                                            | Description                                         |
|--------------------|----------------------------------------------------------|-----------------------------------------------------|
| token_github       | ghp_                                                     | we need token for publish image result to repo      |
| username_github    | azkadev                                                  | we need username github for fetch data sponsor list |
| repo_github        | azkadev/azkadev                                          | we need repo for location release image result      |
| release_tag_name   | sponsor                                                  | we need tag name for location release               |
| image_name         | sponsor.png                                              |                                                     |
| repo_update_github | azkadev/general azkadev/general_framework azkadev/akadev |                                                     |
## Example Github Actions

## Example Result

<img align="center" src=".github/sponsor.png">

I don't have expert or high value for design, if you wan't other style you can create issue in here 