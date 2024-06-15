library(ggplot2)
library(maps)
library(mapdata)
library(mapproj)

read.table(text='region St-Abbr colors
                 wisconsin          WI    #00931e
                 "new york"         NY    #00931e
                 massachusetts      MA    #00931e
                 oregon             OR    #00931e
                 washington         WA    #00931e
                 california         CA    #00931e
                 arizona            AR    #00931e
                 nevada             NV    #00931e
                 texas              TX    #00931e',
           stringsAsFactors=FALSE, header=TRUE, comment.char="") -> df

state <- map_data('state')

#print(colnames(state))


ggplot() +
    geom_map(data=state, map=state,
                aes(x=long,y=lat,map_id=region),
                color="#2b2b2b", linewidth=0.15, fill="grey") +
    geom_map(data=df, map=state,
                aes(fill="blue", map_id=region),
                color="#2b2b2b", linewidth=0.15) +
    scale_color_identity() +
    coord_map("polyconic") +
    theme_void() +
    theme(legend.position="none")
