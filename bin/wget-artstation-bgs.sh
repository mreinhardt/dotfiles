#!/usr/bin/zsh
images="https://cdna.artstation.com/p/assets/images/images/002/239/492/large/bayard-wu-dead-dragon.jpg
https://cdna.artstation.com/p/assets/images/images/001/032/036/large/bayard-wu-05.jpg
https://cdnb.artstation.com/p/assets/images/images/001/806/187/large/atey-ghailan-160b.jpg
https://cdna.artstation.com/p/assets/images/images/000/967/204/large/sergey-kolesov-top-landscape-01-small.jpg
https://cdna.artstation.com/p/assets/images/images/000/922/974/large/alexander-mandradjiev-dark-magic-2.jpg
https://cdna.artstation.com/p/assets/images/images/000/922/976/large/alexander-mandradjiev-floating-islands-1.jpg
https://cdna.artstation.com/p/assets/images/images/000/922/966/large/alexander-mandradjiev-journey-1.jpg
https://cdna.artstation.com/p/assets/images/images/003/367/358/large/donato-giancola-fellowship-descentfromcaradhras-donato-1400.jpg
https://cdnb.artstation.com/p/assets/images/images/000/275/275/large/OXAN_Riverbed.jpg
https://cdnb.artstation.com/p/assets/images/images/001/792/143/large/sparth-halo5-city-concept.jpg
https://cdna.artstation.com/p/assets/images/images/004/629/464/large/florent-lebrun-uncharted.jpg
https://cdnb.artstation.com/p/assets/images/images/003/175/763/large/florent-lebrun-ilm-challenge-dagobah-fl-v001.jpg
https://cdnb.artstation.com/p/assets/images/images/000/142/689/large/florent-lebrun-caca.jpg
https://cdna.artstation.com/p/assets/images/images/000/043/000/large/snow_village.jpg
https://cdna.artstation.com/p/assets/images/images/000/043/004/large/crack.jpg
https://cdnb.artstation.com/p/assets/images/images/000/043/005/large/Ice_landscape_002_copy.jpg
https://cdnb.artstation.com/p/assets/images/images/004/109/435/large/suke-water.jpg
https://cdnb.artstation.com/p/assets/images/images/001/745/283/large/justin-sweet-1-083.jpg
https://cdna.artstation.com/p/assets/images/images/001/745/322/large/justin-sweet-1-093.jpg
https://cdna.artstation.com/p/assets/images/images/000/246/878/large/daniel-romanovsky-planetfall-01-final.jpg
https://cdnb.artstation.com/p/assets/images/images/003/387/077/large/christian-bravery-giant.jpg
https://cdna.artstation.com/p/assets/images/images/000/084/134/large/ME_010_London.jpg
https://cdna.artstation.com/p/assets/images/images/000/084/072/large/prologue_B__Jack_and_the_pack_002.jpg
https://cdnb.artstation.com/p/assets/images/images/000/084/067/large/prologue_A__desparate_dash_002B.jpg
https://cdna.artstation.com/p/assets/images/images/000/084/054/large/Chapter_1_A__the_observatory_001.jpg
https://cdnb.artstation.com/p/assets/images/images/000/501/725/large/thom-tenery-thomtenery-elvencity-wotc.jpg
https://cdnb.artstation.com/p/assets/images/images/004/803/223/large/joseph-watmough-forest-01.jpg
https://cdna.artstation.com/p/assets/images/images/000/482/036/large/alex-brady-gbsig.jpg
https://cdna.artstation.com/p/assets/images/images/001/368/212/large/alex-brady-gc.jpg
https://cdnb.artstation.com/p/assets/images/images/001/368/211/large/alex-brady-gdsig.jpg
https://cdnb.artstation.com/p/assets/images/images/000/482/043/large/alex-brady-fbsig.jpg
https://cdnb.artstation.com/p/assets/images/images/000/159/407/large/eric-lloyd-brown-black-ice-planet-vehicle.jpg
https://cdna.artstation.com/p/assets/images/images/000/156/290/large/tuomas-korpi-dream-garden-1600x840.jpg
https://cdna.artstation.com/p/assets/images/images/000/111/532/large/emmanuel-shiu-sherman-006.jpg
https://cdna.artstation.com/p/assets/images/images/000/106/694/large/pavel-elagin-below-the-canopy-05.jpg
https://cdna.artstation.com/p/assets/images/images/000/236/854/large/arnaud-pheu-gianttrees.jpg
https://cdna.artstation.com/p/assets/images/images/001/441/620/large/eytan-zana-glacier4-2.jpg
https://cdnb.artstation.com/p/assets/images/images/000/074/631/large/16.jpg
https://cdnb.artstation.com/p/assets/images/images/003/808/259/large/james-zapata-travel.jpg
https://cdnb.artstation.com/p/assets/images/images/000/053/351/large/bathedinlight.jpg
https://cdna.artstation.com/p/assets/images/images/000/053/342/large/mononoke.jpg
https://cdnb.artstation.com/p/assets/images/images/000/053/297/large/junglestealth.jpg
https://cdnb.artstation.com/p/assets/images/images/003/878/705/large/mike-azevedo-02.jpg
https://cdna.artstation.com/p/assets/images/images/000/577/980/large/alex-konstad-obliskura-environment-onilithforest-01.jpg
https://cdnb.artstation.com/p/assets/images/images/000/561/399/large/alex-konstad-enviro-final-2.jpg
https://cdna.artstation.com/p/assets/images/images/000/535/250/large/alex-konstad-jotunheim-environment-giantskeep.jpg
https://cdna.artstation.com/p/assets/images/images/000/535/248/large/alex-konstad-jotunheim-environment-giantschasm.jpg
https://cdna.artstation.com/p/assets/images/images/000/656/428/large/alex-konstad-dragonsnest.jpg"

while read -r image; do
    url_nums=$(echo -n "$image" | grep -oE '[0-9]/[0-9]{3}/[0-9]{3}' | sed 's#/#-#g')
    url_filename=$(echo -n "$image" | grep -oE '[^/]*$')
    filename="${url_nums}-${url_filename}"
    if [[ -e $filename ]]; then
        echo "Image already here! $filename"
    else
        wget -nv --output-document="$filename" "$image"
        sleep_time="$(shuf -i2-8 -n1)s"
        echo "Sleeping $sleep_time..."
        sleep $sleep_time
    fi
done <<< "$images"
