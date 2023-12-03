#2021
perl parse_ods.pl ods_files/Generacion-Electrica-2021.ods 2021 > ods_files/Generacion-Electrica-2021.csv
perl prod_tidy.pl ods_files/Generacion-Electrica-2021.csv > ods_files/Generacion-Electrica-2021-tidy.csv
perl prod_tidy.pl ods_files/Generacion-Electrica-2021.csv > ods_files/Generacion-Electrica-2021-tidy.csv
perl normalize_byPop.pl ods_files/Generacion-Electrica-2021-tidy.csv poblacion_prov_serie_historica_INE_aggregada_utf8.csv prov_conv_diccionari.csv > ods_files/Generacion-Electrica-2021-tidy-pob.csv
perl normalize_byPIB.pl ods_files/Generacion-Electrica-2021-tidy-pob.csv PIB_precioMercado_prov_serie_homogenea_2000_2021_INE.csv prov_conv_diccionari.csv > ods_files/Generacion-Electrica-2021-tidy-pob-pib.csv

#2020
perl parse_ods.pl ods_files/Generacion-Electrica-2020.ods 2020 > ods_files/Generacion-Electrica-2020.csv
perl prod_tidy.pl ods_files/Generacion-Electrica-2020.csv > ods_files/Generacion-Electrica-2020-tidy.csv
perl normalize_byPop.pl ods_files/Generacion-Electrica-2020-tidy.csv poblacion_prov_serie_historica_INE_aggregada_utf8.csv prov_conv_diccionari.csv > ods_files/Generacion-Electrica-2020-tidy-pob.csv
perl normalize_byPIB.pl ods_files/Generacion-Electrica-2020-tidy-pob.csv PIB_precioMercado_prov_serie_homogenea_2000_2021_INE.csv prov_conv_diccionari.csv > ods_files/Generacion-Electrica-2020-tidy-pob-pib.csv

#2019
perl parse_ods.pl ods_files/Generacion-Electrica-2019.ods 2019 > ods_files/Generacion-Electrica-2019.csv
perl prod_tidy.pl ods_files/Generacion-Electrica-2019.csv > ods_files/Generacion-Electrica-2019-tidy.csv
perl normalize_byPop.pl ods_files/Generacion-Electrica-2019-tidy.csv poblacion_prov_serie_historica_INE_aggregada_utf8.csv prov_conv_diccionari.csv > ods_files/Generacion-Electrica-2019-tidy-pob.csv
perl normalize_byPIB.pl ods_files/Generacion-Electrica-2019-tidy-pob.csv PIB_precioMercado_prov_serie_homogenea_2000_2021_INE.csv prov_conv_diccionari.csv > ods_files/Generacion-Electrica-2019-tidy-pob-pib.csv
perl parse_ods.pl ods_files/Electricidad-Comercializada-Tarifas-Provincias-2019.ods 2019 | grep -P "TOTAL|PROV" | cut -f 1,5,6 > ods_files/Electricidad-Comercializada-Tarifas-Provincias-2019.csv

#2018
perl parse_ods.pl ods_files/Generacion-Electrica-2018.ods 2018 > ods_files/Generacion-Electrica-2018.csv
perl prod_tidy.pl ods_files/Generacion-Electrica-2018.csv > ods_files/Generacion-Electrica-2018-tidy.csv
perl normalize_byPop.pl ods_files/Generacion-Electrica-2018-tidy.csv poblacion_prov_serie_historica_INE_aggregada_utf8.csv prov_conv_diccionari.csv > ods_files/Generacion-Electrica-2018-tidy-pob.csv
perl normalize_byPIB.pl ods_files/Generacion-Electrica-2018-tidy-pob.csv PIB_precioMercado_prov_serie_homogenea_2000_2021_INE.csv prov_conv_diccionari.csv > ods_files/Generacion-Electrica-2018-tidy-pob-pib.csv
perl parse_ods.pl ods_files/Electricidad-Comercializada-Tarifas-Provincias-2018.ods 2018 | grep -P "TOTAL|PROV" | cut -f 1,5,6  > ods_files/Electricidad-Comercializada-Tarifas-Provincias-2018.csv

#2017
perl parse_ods.pl ods_files/Generacion-Electrica-2017.ods 2017 > ods_files/Generacion-Electrica-2017.csv
perl prod_tidy.pl ods_files/Generacion-Electrica-2017.csv > ods_files/Generacion-Electrica-2017-tidy.csv
perl normalize_byPop.pl ods_files/Generacion-Electrica-2017-tidy.csv poblacion_prov_serie_historica_INE_aggregada_utf8.csv prov_conv_diccionari.csv > ods_files/Generacion-Electrica-2017-tidy-pob.csv
perl normalize_byPIB.pl ods_files/Generacion-Electrica-2017-tidy-pob.csv PIB_precioMercado_prov_serie_homogenea_2000_2021_INE.csv prov_conv_diccionari.csv > ods_files/Generacion-Electrica-2017-tidy-pob-pib.csv
perl parse_ods.pl ods_files/Electricidad-Comercializada-Tarifas-Provincias-2017.ods 2017 | grep -P "TOTAL|PROV" | cut -f 1,5,6 > ods_files/Electricidad-Comercializada-Tarifas-Provincias-2017.csv

#2016
perl parse_ods.pl ods_files/Generacion-Electrica-2016.ods 2016 > ods_files/Generacion-Electrica-2016.csv
perl prod_tidy.pl ods_files/Generacion-Electrica-2016.csv > ods_files/Generacion-Electrica-2016-tidy.csv
perl normalize_byPop.pl ods_files/Generacion-Electrica-2016-tidy.csv poblacion_prov_serie_historica_INE_aggregada_utf8.csv prov_conv_diccionari.csv > ods_files/Generacion-Electrica-2016-tidy-pob.csv
perl normalize_byPIB.pl ods_files/Generacion-Electrica-2016-tidy-pob.csv PIB_precioMercado_prov_serie_homogenea_2000_2021_INE.csv prov_conv_diccionari.csv > ods_files/Generacion-Electrica-2016-tidy-pob-pib.csv
perl parse_ods.pl ods_files/Electricidad-Comercializada-Tarifas-Provincias-2016.ods 2016 | grep -P "TOTAL|PROV" | cut -f 1,5,7 > ods_files/Electricidad-Comercializada-Tarifas-Provincias-2016.csv

#2015
perl parse_ods.pl ods_files/Generacion-Electrica-2015.ods 2015 > ods_files/Generacion-Electrica-2015.csv
perl prod_tidy.pl ods_files/Generacion-Electrica-2015.csv > ods_files/Generacion-Electrica-2015-tidy.csv
perl normalize_byPop.pl ods_files/Generacion-Electrica-2015-tidy.csv poblacion_prov_serie_historica_INE_aggregada_utf8.csv prov_conv_diccionari.csv > ods_files/Generacion-Electrica-2015-tidy-pob.csv
perl normalize_byPIB.pl ods_files/Generacion-Electrica-2015-tidy-pob.csv PIB_precioMercado_prov_serie_homogenea_2000_2021_INE.csv prov_conv_diccionari.csv > ods_files/Generacion-Electrica-2015-tidy-pob-pib.csv
perl parse_ods.pl ods_files/Electricidad-Comercializada-Tarifas-Provincias-2015.ods 2015  | grep -P "TOTAL|PROV" | cut -f 1,5,7 > ods_files/Electricidad-Comercializada-Tarifas-Provincias-2015.csv

#2014
perl parse_ods.pl ods_files/Generacion-Electrica-2014.ods 2014 > ods_files/Generacion-Electrica-2014.csv
perl prod_tidy.pl ods_files/Generacion-Electrica-2014.csv > ods_files/Generacion-Electrica-2014-tidy.csv
perl normalize_byPop.pl ods_files/Generacion-Electrica-2014-tidy.csv poblacion_prov_serie_historica_INE_aggregada_utf8.csv prov_conv_diccionari.csv > ods_files/Generacion-Electrica-2014-tidy-pob.csv
perl normalize_byPIB.pl ods_files/Generacion-Electrica-2014-tidy-pob.csv PIB_precioMercado_prov_serie_homogenea_2000_2021_INE.csv prov_conv_diccionari.csv > ods_files/Generacion-Electrica-2014-tidy-pob-pib.csv
perl parse_ods.pl ods_files/Electricidad-Comercializada-Tarifas-Provincias-2014.ods 2014  | grep -P "TOTAL|PROV" | cut -f 1,5,7 > ods_files/Electricidad-Comercializada-Tarifas-Provincias-2014.csv

#2013
perl parse_ods.pl ods_files/Generacion-Electrica-2013.ods 2013 > ods_files/Generacion-Electrica-2013.csv
perl prod_tidy.pl ods_files/Generacion-Electrica-2013.csv > ods_files/Generacion-Electrica-2013-tidy.csv
perl normalize_byPop.pl ods_files/Generacion-Electrica-2013-tidy.csv poblacion_prov_serie_historica_INE_aggregada_utf8.csv prov_conv_diccionari.csv > ods_files/Generacion-Electrica-2013-tidy-pob.csv
perl normalize_byPIB.pl ods_files/Generacion-Electrica-2013-tidy-pob.csv PIB_precioMercado_prov_serie_homogenea_2000_2021_INE.csv prov_conv_diccionari.csv > ods_files/Generacion-Electrica-2013-tidy-pob-pib.csv
perl parse_ods.pl ods_files/Electricidad-Comercializada-Tarifas-Provincias-2013.ods 2013 | grep -P "TOTAL|PROV" | cut -f 1,5,7 > ods_files/Electricidad-Comercializada-Tarifas-Provincias-2013.csv


#ALL
head -1 ods_files/Generacion-Electrica-2020-tidy-pob-pib.csv > header
cat  */*pob-pib.csv | sort -k1 -k2 -k5 | grep -v PROV  > ods_files/Generacion-Electrica-ALL_withoutHeader.csv
cat header ods_files/Generacion-Electrica-ALL_withoutHeader.csv > ods_files/Generacion-Electrica-ALL.csv
rm ods_files/Generacion-Electrica-ALL_withoutHeader.csv
rm header

head -1 ods_files/Electricidad-Comercializada-Tarifas-Provincias-2019.csv > header
cat  */Electricidad-Comercializada-Tarifas-Provincias-2*csv | grep -v PROV  > ods_files/Electricidad-Comercializada-Tarifas-Provincias-ALL_withoutHeader.csv
cat header ods_files/Electricidad-Comercializada-Tarifas-Provincias-ALL_withoutHeader.csv > ods_files/Electricidad-Comercializada-Tarifas-Provincias-ALL.csv
rm ods_files/Electricidad-Comercializada-Tarifas-Provincias-ALL_withoutHeader.csv
rm header


