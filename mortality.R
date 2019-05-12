#On se préoccupe du dataset de 2015 pour le moment
#Comme il y a beaucoup trop de données, on se restreint pour le moment à 10%
#Dans la version finale, on utilisera toutes les lignes
data=read.csv2("/Users/Wildsoap/Documents/MAIN4/analyseDonneesTP/2015_data.csv",header=T,sep=",",nrows=271765)
data2=read.csv2("/Users/Wildsoap/Documents/MAIN4/analyseDonneesTP/2015_data.csv",header=F,sep=",",nrows=10000)
head(data)

#data2 c'est pour voir les numéros de colonnes


#J'ai piqué ça sur internet
require("RColorBrewer") #Used for graphic colors
require("ggplot2") #used for some plottiing
require("reshape") #used to reformat data

#Pour supprimer les morts dont on ne connaît pas l'âge (999)
morts <- data[data$detail_age < 125, ]  


#Nombre de morts
NROW(morts) 

#Espérance de vie
mean(morts$detail_age)
#On pourra l'afficher dans la soutenance

hist(morts$detail_age, , xlab = "Age du décès", main = "Fréquence des âges de décès", col = "light blue")
#ylim = c(0, 400000)

mortsDeterminee <- morts[which(morts$manner_of_death==1 | morts$manner_of_death==2 | morts$manner_of_death==3 | morts$manner_of_death==7),]  

x <- data.frame(aggregate(mortsDeterminee$detail_age ~ mortsDeterminee$manner_of_death, FUN = mean))

barplot(x$mortsDeterminee.detail_age, 
        col = brewer.pal(5, "Set2"),
        ylab = "Âge de décès moyen",
        xlab = "Causes du décès ",
        main = "Causes du décès les plus communes selon les âges",
        names.arg = c("Accident", "Suicide", "Homicide","Naturel")
)




#Boxplot showing Age of Death vs. Marital Status
boxplot(mortsDeterminee$detail_age ~ mortsDeterminee$manner_of_death,
        col = brewer.pal(5, "Set1"),
        whisklty = 1,
        staplelty = 0,
        main = "Les causes du décès en fonction de l'âge",
        xlab = "Causes du décès",
        outcol = brewer.pal(5, "Set1"),
        outpch = 16, #outlier symbol
        names.arg = c("Accident", "Suicide", "Homicide","Naturel"),
        ylab = "Âge de décès",
)



#Changer l'ordonnée, en changeant peut-être le dataset


cleandata=subset(data,select=c(3,5,6,8,19,22,71))

#Colonne 3 = niveau d'éducation  data$education_2003_revision
#Colonne 5 = Mois de la mort
#Colonne 6 = Genre
#Colonne 8 = âge data$detail_age
#Colonne 19 = Cause du dècès data$manner_of_death
#Colonne 22 = Activités (pas toujours remplit)
#Colonne 71 = Origines

str(cleandata)

#On va plutôt essayer de tirer des choses de ce nouveau dataset, plus condensé et moins bordélique

#Sachant qu'on a plusieurs dataset pour chaque année
#Afin d'avoir plusieurs valeurs quantitatives
#On pourrait sommer tous les individus de tel genre, et/ou tel origine, par années.
#Après on pourrait les exploiter un peu plus
           


