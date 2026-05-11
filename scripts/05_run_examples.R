source("functions/plot_pk_flexible.R")
source("scripts/01_create_pk_data.R")
source("scripts/02_pk_summary.R")
source("scripts/03_blq_pk_data.R")
source("scripts/04_pk_data_dose.R")
#plotting linear concentration time plot
plot_pk_flexible(data = pk_data,
                 y_var ="CONC",
                 color_var = "TRT",
                 group_var = "USUBJID",
                 shape_var = NULL,
                 show_lloq = FALSE,
                 show_errorbar= FALSE,
                 ymin_var = NULL,
                 ymax_var = NULL,
                 lloq = NULL,
                 log_scale = FALSE,
                 facet_var = NULL,
                 title = "PK Concentration-Time Plot",
                 xlabel = "Time(Hours)",
                 ylabel = "Concentration"
                 )
#Plottting semi log plot
plot_pk_flexible(data = pk_data,
                 y_var ="CONC",
                 color_var = "TRT",
                 group_var = "USUBJID",
                 shape_var = NULL,
                 show_lloq = FALSE,
                 show_errorbar= FALSE,
                 ymin_var = NULL,
                 ymax_var = NULL,
                 lloq = NULL,
                 log_scale = TRUE,
                 facet_var = NULL,
                 title = "PK Concentration-Time Semi log Plot",
                 xlabel = "Time(Hours)",
                 ylabel = "Concentration"
)
#plotting BLQFL
plot_pk_flexible(data = pk_data_blq,
                 y_var ="CONC",
                 color_var = "TRT",
                 group_var = "USUBJID",
                 shape_var = "BLQFL",
                 show_lloq = TRUE,
                 show_errorbar= FALSE,
                 ymin_var = NULL,
                 ymax_var = NULL,
                 lloq = 5,              
                 log_scale = FALSE,
                 facet_var = NULL,
                 title = "PK Concentration-Time Semi log Plot",
                 xlabel = "Time(Hours)",
                 ylabel = "Concentration"
)
#plotting mean concentration time profiles
plot_pk_flexible(data = pk_summary,
                 y_var ="mean_conc",
                 color_var = "TRT",
                 group_var = "TRT",
                 shape_var = NULL,
                 show_lloq = FALSE,
                 show_errorbar= TRUE,
                 ymin_var = "ymin",
                 ymax_var = "ymax",
                 lloq = NULL,              
                 log_scale = FALSE,
                 facet_var = "TRT",
                 title = "Mean Concentration-Time Plot",
                 xlabel = "Time(Hours)",
                 ylabel = "Mean Concentration"
)
#plotting dose normalized concentrations
plot_pk_flexible(data = pk_data_dose,
                 y_var ="CONC_NORM",
                 color_var = "TRT",
                 group_var = "USUBJID",
                 shape_var = NULL,
                 show_lloq = FALSE,
                 show_errorbar= FALSE,
                 ymin_var = NULL,
                 ymax_var = NULL,
                 lloq = NULL,              
                 log_scale = FALSE,
                 facet_var = "TRT",
                 title = "Dose-Normalized Concentration-Time Plot",
                 xlabel = "Time(Hours)",
                 ylabel = "Dose-Noemalized Concentration"
)
