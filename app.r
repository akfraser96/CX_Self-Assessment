library(DT)
library(data.table)
library(shiny)
library(ggplot2)
library(gridExtra)
library(knitr)
library(shinyscreenshot)



################################## finalize ######################################


#https://medium.com/@joyplumeri/using-r-shiny-to-create-web-surveys-display-instant-feedback-and-store-data-on-google-drive-68f46eea0f8b


row_q <- c("Integrate insights about client needs, preferences and behaviours into your project plan. Example of insights - choice of channel, service expectations.",
          "Integrate input from employees (e.g., call centre and in-person service officers, medical adjudicators) about their experiences in delivering programs and services with similar target audiences, where this information was not already available.",
          "Collaborate with the Client Feedback Centre of Expertise to obtain client feedback collected by the different service delivery channels, e.g., post-call or online intercept surveys.",
           "Involve stakeholders in Policy, Program and Service, as well as the CX Centre of Expertise, to address pain points in your initiative's client experience.",
           "Consult with the CX Centre of Expertise to obtain guidance on how to execute CX practices.")

row_q2 <-c("Use client feedback to inform the design.", 
           "Conduct usability testing with your target audience to validate the proposed process and technology meets/satisfies their needs.",
           "Align your redesign with ESDC's CX goals to create positive client interactions, e.g., their experience via the different channels such as Web, phone or in-person.", 
           "Document and review the full client journey to identify where overly complex or unnecessary activities could be eliminated.",
           "Involve stakeholders in the design process, e.g., policy, program managers, IT, legal, service delivery partners to identify the impact of planned changes." )

row_q3 <- c("Review and analyze performance data and use it to improve the CX.", 
            "Identify key performance indicators (KPIs) that measure client experience.", 
            "Have a plan to communicate CX insights in a practical and usable way to inform employees and senior management (report, dashboards, etc.).")

row_q4 <- c("Plan to monitor and address any unintended service barriers by re-adjusting your CX needs and goals as part of a continuous service improvement strategy.", 
            "Use client insights to facilitate discussions in meetings, working groups or committees to get support and buy-in.", 
            "Consult the CX Survey results, CX tools and other data sources for information and insights about your target audience's service wants and needs.", 
            HTML(paste("Plan to document and share success stories from your initiative to encourage others in the organization to continue on the path of client-centricity.")))



############################   FRENCH ROWS FOR EXISTING INITIATIVE TABLES

row_q_f <- c(HTML(paste0("Int&#233;gr&#233; &#224; votre plan de projet des points de vue des clients sur les besoins, les pr&#233;f&#233;rences et les comportements? Exemple de points de vue &#58; sur le choix du mode, les attentes en mati&#232;re de services.")),
             HTML(paste0("Int&#233;gr&#233; les id&#233;es formul&#233;es par les employ&#233;s (agents des services en personne et ceux des centres d&#39appels, &#233;valuateurs m&#233;dicaux) &#224; propos de leurs exp&#233;riences en mati&#232;re de prestation de programmes et de services qui ciblent des groupes semblables, l&#224; o&ugrave; cette information n&#39est pas d&#233;j&#224; disponible?")),
             HTML(paste0("Collabor&#233; avec le Centre d&#39expertise de la r&#233;troaction des clients pour obtenir les commentaires des clients recueillis par les diff&#233;rents modes de prestation de service, p. ex. les sondages aupr&#232;s de visiteurs intercept&#233;s en ligne?")),
             HTML(paste0("Fait participer les intervenants qui participent &#224; l&#39&#233;laboration des politiques, des programmes et des services, ainsi que du Centre d&#39expertise de l&#39EC pour rep&#233;rer les &#233;l&#233;ments difficiles li&#233;s &#224; l&#39exp&#233;rience client de votre initiative?")),
             HTML(paste0("Consult&#233; le Centre d&#39expertise de l&#39EC pour obtenir des conseils sur la fa&#231;on de mettre en ouvre les pratiques en mati&#232;re d&#39EC?"))
)


row_q_f_2 <- c(HTML(paste("Utilis&#233; les commentaires des clients pour orienter la conception?")),
              HTML(paste("Effectu&#233; des essais de convivialit&#233; avec votre public cible pour valider que le processus et la technologie propos&#233;s r&#233;pondent &#224; leurs besoins?")),
              HTML(paste("Alignez votre restructuration sur les objectifs d&#39EDSC en mati&#232;re d&#39EC pour cr&#233;er des interactions positives avec les clients, p. ex. leur exp&#233;rience par les diff&#233;rents modes de prestation de service, p. ex. les sondages aupr&#232;s de visiteurs intercept&#233;s en ligne via les diff&#233;rents canaux tels que le Web, le t&#233;l&#233;phone ou en personne.")),
              HTML(paste("Document&#233; et examin&#233; le parcours complet du client pour identifier les activit&#233;s trop complexes ou inutiles qui pourraient &ecirc;tre &#233;limin&#233;es?")),
               HTML(paste("Fait participer les intervenants dans le processus de conception, p. ex., les responsables des politiques, des programmes, des TI, des services juridiques et des partenaires de la prestation des services, afin de cerner les r&#233;percussions des changements pr&#233;vus."))
)

row_q_f_3 <- c(HTML(paste("Examin&#233; et analys&#233; les donn&#233;es relatives au rendement et les avez-vous utilis&#233;es pour am&#233;liorer l&#39EC?")),
             HTML(paste("D&#233;terminer les indicateurs de rendement cl&#233;s (IRC) qui permettent de mesurer l&#39exp&#233;rience client.")),
             HTML(paste("Disposer d&#39un plan pour communiquer les points de vue sur l&#39EC d&#39une mani&#232;re pratique et utilisable pour informer les employ&#233;s et la direction (rapports, tableaux de bord, etc.)"))
)


row_q_f_4 <- c(HTML(paste("Pr&#233;vu de surveiller et d&#39&#233;liminer tout obstacle impr&#233;vus au service en r&#233;ajustant vos besoins et objectifs en mati&#232;re d&#39EC dans le cadre d&#39une strat&#233;gie d&#39am&#233;lioration continue du service.")),
             HTML(paste("Utilisez les points de vue des clients pour faciliter les discussions dans les r&#233;unions, les groupes de travail ou les comit&#233;s afin d&#39obtenir le soutien et l&#39adh&#233;sion.")),
             HTML(paste("Consultez les r&#233;sultats du sondage sur l&#39EC, les outils en mati&#232;re d&#39EC et d&#39autres sources de donn&#233;es pour obtenir des informations et des points de vue sur les souhaits et les besoins de votre public cible en mati&#232;re de services.")),
             HTML(paste("Pr&#233;voyez de documenter les succ&#232;s de votre initiative et d&#39en faire part afin d&#39encourager les autres membres de l&#39organisation &#224; poursuivre l&#39approche ax&#233;e sur le client."))
)



wp1 <- tagList(wellPanel( 
  #francais <- paste("Fran&ccedil;ais"),
  actionButton("french", HTML(paste("Fran&ccedil;ais")), style='padding:10px; background-color: #F0F0F0; font-size:100%; vertical-align: top; color: black; font-weight: bold; display:left-align' ),
  h1("CX Self-Assessment Tool"),
  h2("Applying CX everywhere, every day"), style = list('background: white;', "border-style: none;"),
  tags$head(
    tags$style(HTML("
      h1 {
        font-family: Arial, sans-serif;
        font-weight: bold;
        line-height: 1.1;
        font-size: 50px;
        color: #248c84;
        text-align: center
      }"))),
  tags$style(HTML("
      h2 {
        font-family: Arial, sans-serif;
        font-weight: bold;
        line-height: 1.1;
        color: black;
        text-align: center;
        font-size: 30px;
      }"
  ))))


wp1_f <- tagList(wellPanel( 
  #francais <- paste("Fran&ccedil;ais"),
  actionButton("english", "English", onclick="location.href='http://esdc-cx-coe.eastus2.cloudapp.azure.com:3838/CX_Self-Assessment/';", style='padding:10px; background-color: #F0F0F0; font-size:100%; vertical-align: top; color: black; font-weight: bold' ),
  h1(HTML(paste("Outil d'auto&eacute;valuation de l'EC"))),
  h2("Appliquer l'EC partout, tous les jours"), style = list('background: white;', "border-style: none;"),
  tags$head(
    tags$style(HTML("
      h1 {
        font-family: Arial, sans-serif;
        font-weight: bold;
        line-height: 1.1;
        font-size: 50px;
        color: #248c84;
        text-align: center
      }")))
  # tags$style(HTML("
  #     h4 {
  #       font-family: Arial, sans-serif;
  #       font-weight: bold;
  #       line-height: 1.1;
  #       color: black;
  #       text-align: center;
  #       font-size: 30px;
  #     }"
  # ))
  ))




intro<-  tagList(wellPanel( br(),
                            h3("Why use this self-assessment tool?", style = "color:#248c84;"),
                            p("At ESDC, how we design and deliver policies, programs and services is fundamental to meeting the evolving needs and expectations of our clients. This tool assesses the various ways to apply a CX lens to your work, and outlines how to use CX practices to shape the design and/or improvement of policies, programs and services."),
                            #h5("Please select one of the following:"),
                            style = list('background: white;', "border-style: none;", "padding: 0px;"),
                            #p("Please fill out the table below, which will serve as your initiative documentation."), #### increase space here ####################################
                            tags$head(
                              tags$style(HTML("
                                  h5 {
                                    font-family: Arial, sans-serif;
                                    font-weight: bold;
                                    line-height: 1.1;
                                    font-size: 20px;
                                    color: #248c84;
                                    text-align: left
                                  }"))),
                              tags$style(HTML("
                                    h6 {
                                      font-family: Arial, sans-serif;
                                      font-weight: bold;
                                      line-height: 1.1;
                                      color: black;
                                      text-align: left;
                                      font-size: 20px;
                                    }
                                    p {
                                      font-family: Arial, sans-serif;
                                      font-weight: normal;
                                      line-height: 1.4;
                                      color: black;
                                    }"
                                                          )))
                      )


intro_f<-  tagList(wellPanel( br(),
                            h3(HTML(paste("Pourquoi se servir de cet outil d'auto&eacute;valuation?")),style = "color:#248c84;"),
                            p(HTML(paste("&Agrave; EDSC, la fa&ccedil;on dont nous concevons et mettons en ouvre nos politiques, programmes et services est fondamentale &agrave; la satisfaction des besoins et des attentes en &eacute;volution de nos clients. Cet outil &eacute;value les diff&eacute;rentes fa&ccedil;ons d'appliquer l'optique de l'exp&eacute;rience client &agrave; votre travail, et d&eacute;crit comment utiliser les pratiques en mati&ccedil;re d'EC pour fa&ccedil;onner la conception et/ou l'am&eacute;lioration des politiques, des programmes et des services."))),
                            style = list('background: white;', "border-style: none;", "padding: 0px;"),
                            tags$head(
                              tags$style(HTML("
                                  h5 {
                                    font-family: Arial, sans-serif;
                                    font-weight: bold;
                                    line-height: 1.1;
                                    font-size: 20px;
                                    color: #248c84;
                                    text-align: left
                                  }"))),
                            tags$style(HTML("
                                    h6 {
                                      font-family: Arial, sans-serif;
                                      font-weight: bold;
                                      line-height: 1.1;
                                      color: black;
                                      text-align: left;
                                      font-size: 20px;
                                    }
                                    p {
                                      font-family: Arial, sans-serif;
                                      font-weight: normal;
                                      line-height: 1.4;
                                      color: black;
                                    }"
                            )))
)







# wp2 <- tagList(wellPanel(
#   h4("CLIENT-DRIVEN PLANNING"), style = list("border-style: none;", "background: white;"),
#   #p("Every client has their own journey. Knowing who your clients are and what they do, think and feel when they interact with ESDC will positively impact reaching your goals."), 
#   style = "background: white",
#   tags$head(
#     tags$style(HTML("
#       p {
#         font-family: Arial, sans-serif;
#         font-weight: bold;
#         line-height: 1.1;
#         color: black;
#       }"))
#   )))

wp2 <- h4("CLIENT-DRIVEN PLANNING")

wpara <- tagList(wellPanel( style = "padding: 0px;", tags$style(type="text/css", "#wpara { margin-bottom: -60px }"),
                            p("Every client has their own journey. Knowing who your clients are and what they do, think and feel when they interact with ESDC will positively impact reaching your goals."), style = list("background: #248c84; padding:0;margin:0;"),
                            tags$head(
                              tags$style(HTML("
                              p {
                                  font-family: Arial, sans-serif;
                                  font-weight: normal;
                                  line-height: 1.1;
                                  color: white;
                                }
                                ")))))

wp3 <- h4("DESIGNING PROGRAMS AND SERVICES")

wp4 <- h4("MEASURING CX OUTCOMES")

wp5 <- h4("WORKING IN A CLIENT-CENTRIC WAY")

######################################## start of app  ################################################################################################

#######################################################################################################################################################

shinyApp(
  ui = fluidPage(
    ####### start with formatting - move this to separate CSS sheet. <h3>
    tags$head(
      tags$style(HTML("
              h3 {
                font-family: Arial, sans-serif;
                font-weight: bold;
                line-height: 1.1;
                color: black;
                font-size: 30px;
              text-align: left;
              }
              
               h4 {
                font-family: Arial, sans-serif;
                font-weight: bold;
                line-height: 1.1;
                color: #248c84;
                font-size: 24px;
               text-align: left;
              }
              
              
              h2 {
                font-family: Arial, sans-serif;
                font-weight: bold;
                line-height: 1.1;
                color: black;
              }
            "))),
    tags$head(tags$style(type="text/css", ".container-fluid {  max-width: 1700px; padding-left: 80px;/* or 950px */}")),
    tags$style("@import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
            * {
              padding: 0;
              margin: 0;
              align: center;
              maring: auto;
              box-sizing: border-box;
              font-family: Arial, sans-serif;
              font-size: 1.7rem
            }
            "),
    tags$head(tags$style(
                      'thead {
                    display: table-header-group;
                    vertical-align: inherit;
                    border-color: white;
                  }
                
                    tr:nth-child(1) {
                      border: solid thick;
                    }
                
                    tr:nth-child(2) {
                      border: solid thick;
                    }
                
                    th {
                      text-align: left;
                      font-size:1.6rem;
                      font-family: arial;
                      background-color: white;
                      color: black;
                    padding-left: -10px;
                    padding-top: 30px;
                      }
                    li {
                  list-style-type: disc;
                  list-style-position: inside;
                  text-indent: -1.5em;
                  padding-left: 3em;
                }
                   td, th {
                    outline: none;
                   }
                   
                   u {    
                    border-bottom: 2px dotted #248c84;
                    text-decoration: none;
                }

                              [aria-label] {
                              position: relative;
                              }
                              
                              [aria-label]:after {
                              content: attr(aria-label);
                              display: none;
                              position: absolute;
                              width: 600px!important;
                              top: 110%;
                              left: -5px!important;
                              z-index: 5000;
                              pointer-events: none;
                              padding: 14px 16px !important;
                              line-height: 25px;
                              white-space: wrap;
                              text-indent: 0;
                              overflow: visible;
                              font-size: 18px!important;
                              font-weight: normal;
                              color: black!important;
                              text-shadow: 0px 0 0px !important;
                              font-family: arial!important;
                              border-top: 3px solid black!important;
                              border-right: 3px solid black!important;
                              border-bottom: 3px solid black!important;
                              background-color: white!important;
                              border-left: 10px solid #248c84!important;
                              -webkit-border-radius: 2px;
                              border-radius: 2px;
                              -webkit-box-shadow: 1px 2px 6px rgba(0,0,0,0);
                              box-shadow: 1px 2px 6px rgba(0,0,0,0.3);
                              }
                              
                              a:focus {
                                outline:1px dashed #E92C6C;
                              }
                              
                              [aria-label]:hover:after, [aria-label]:focus:after {
                              display: block;
                              }
                              
                                 
                              
                              .tooltip {
                                position: relative;
                                display: inline-block;
                                border-bottom: 1px dotted black; /* If you want dots under the hoverable text */
                              }
                              
                              
                                 a:link {
                                color: blue;
                                text-decoration: underline;
                              }
                              
                              
                              
                                  table { 
                                    display: table;
                                    border-collapse: separate;
                                    white-space: normal;
                                    line-height: normal;
                                    font-family: arial;
                                    font-weight: normal;
                                    font-size: medium;
                                    font-style: normal;
                                    color: -internal-quirk-inherit;
                                    text-align: start;
                                    border-spacing: 2px;
                                    border-color: white;
                                    font-variant: normal;
                                    max-width: 1700px;
                                  }  
                              table td {
                                  word-wrap: client-centric;         /* All browsers since IE 5.5+ */
                                  overflow-wrap: client-centric;     /* Renamed property in CSS3 draft spec */
                              }
                                  td {
                                    display: table-cell;
                                    vertical-align: inherit;
                                  }
                              
                                  tr {
                                    display: table-row;
                                    vertical-align: inherit;
                                  }
                                  caption {
                                display: table-caption;
                                text-align: left;
                                color: white;
                                background-color: #248c84;
                                padding: 15px;
                                padding-left: -10px;
                                border: 1px solid black;
                                font-weight: bold;
                                font-size: 18px;
                                font-family: arial;
                              }
                              th:nth-child(4) {
                                  background-color: #E6E6FA;
                              } 
                              
                              th:first-child {
                                  padding-left: -10px;
                              } 
                              
                              td:nth-child(3) {width: 95px;
                              }
                              td:nth-child(4) {width: 95px;
                              }
                                '
                                  )),
    
   
    title = "CX Assessment",
      tags$style("
                        .radio { /* checkbox is a div class*/
                          line-height: 30px;
                          margin-bottom: 40px; /*set the margin, so boxes don't overlap*/
                        }
                        input[type='radio']{ 
                        -webkit-appearance: checkbox; /* Chrome, Safari, Opera */
                        -moz-appearance: checkbox;    /* Firefox */
                        -ms-appearance: checkbox;  /* style for checkboxes */
                          width: 50px; /*Desired width*/
                          height: 35px; /*Desired height*/
                          line-height: 30px; 
                        }
                        span { 
                            margin: auto;                   /*margin-left: 30px;  /*set the margin, so boxes don't overlap labels*/
                            line-height: 30px; 
                        }
                        .content {
                        align: center;
                  }
                    "),
    mainPanel( fluidRow(column( offset = 0, style='padding-top:0px; padding-bottom:50px', width = 12, label = NULL, 
                               
              ###################################     INTRO PAGE ##############################################################################################                  
                                 conditionalPanel(
                                                wp1, intro, 
                                                 condition = ("input.response1 == 0 && input.response2 == 0 && input.french == 0" ),
                                                 br(),
                                                 #actionButton("move", "Move to your section", style='padding:12px; font-size:100%; font-weight: bold'),
                                                 actionButton("response1", "I am planning a new initiative", style='padding:12px; font-size:100%; vertical-align: top; color: black; font-weight: bold'), actionButton("response2", "I am leading an existing initiative", style='padding:12px; font-size:100%; color: black; font-weight: bold'),
                                                 #actionbutton
                                                 br()),
                               
              
                    ### conditional panel french intro
                                conditionalPanel(
                                  wp1_f, intro_f, 
                                  condition = ("input.response1_f == 0 && input.response2_f == 0 && input.french == 1 && input.english == 0 || input.back1 == 1 || input.back2 == 1 && input.response1_f == 0 || input.back1_f == 1 && input.response2_f == 0 || input.back1_f == 1 && input.back2 == 1 " ),
                                  br(),
                                  #actionButton("move", "Move to your section", style='padding:12px; font-size:100%; font-weight: bold'),
                                  actionButton("response1_f", "Je planifie une nouvelle initiative", style='padding:10px; font-size:95%; vertical-align: top; color: black; font-weight: bold'), actionButton("response2_f", HTML(paste("Je dirige une initiative d&eacute;j&agrave; en cours")), style='padding:10px; font-size:95%; color: black; font-weight: bold'),
                                  #actionbutton
                                  br()),
              
              
              
              
              
          ######################################################################     NEW INITIATIVE ##############################################################################                      
                                
                                 conditionalPanel(
                                  condition = ("input.response1 != 0 && input.response2 == 0" ),
                                  width = 12,
                                  actionButton("back1", "Back", onclick="location.href='http://esdc-cx-coe.eastus2.cloudapp.azure.com:3838/CX_Self-Assessment/';"), br(),
                                  br(),
                                  h3("Planning a new initiative", style = list('border-bottom-style: solid;', 'border-color: #248c84;')),
                                  br(),
                                  p("This checklist provides key CX-related practices to consider as part of your initial planning. Once completed, you can use it as discussion points to inform staff, colleagues or senior management on what is needed to adapt a client-centric approach for your initiative."), br(),
                                  p("Before you start, please fill out the table below, which will serve as your initiative documentation."), br(),
                                  DT::dataTableOutput("ruless"), br(), br(),
                                  DT::dataTableOutput('tbl_a'),
                                  br(),
                                  actionButton("complete", "Complete", style='padding:12px; font-size:100%; font-weight: bold;'),
                                  br(), br()),
                                  
                                  conditionalPanel(
                                  condition = ("input.complete ==1"),
                                  uiOutput("warningai", style = ('font-size: 18px; font-weight: bold; color: black')), tags$head(tags$style("#text2{color: black;
                                 font-size: 22px;
                                 font-weight: bold;
                                 font-family: arial;
                                  padding-top:20px;
                                 padding-bottom:20px;
                                 padding-left: 0.5em;
                                 padding-right: 0.5em;
                                 }"
                                  )),
                                  
                                  uiOutput("warninga1", style = list('border-left-style: solid;', 'border-color: white;')),
                                  tags$head(tags$style("#warning2{color: black;
                                 font-size: 18px;
                                 font-weight: normal;
                                 font-family: arial;
                                 border-color: blue
                                 }")),
                                  uiOutput("warninga2", style = list('border-left-style: solid;', 'border-color: white;')),
                                  tags$head(tags$style("#warning2{color: black;
                                 font-size: 18px;
                                 font-weight: normal;
                                 font-family: arial;
                                 border-color: blue
                                 }")),
                                  uiOutput("warninga3", style = list('border-left-style: solid;', 'border-color: white;')),
                                  tags$head(tags$style("#warning2{color: black;
                                 font-size: 18px;
                                 font-weight: normal;
                                 font-family: arial;
                                 border-color: blue
                                 }")), br(), br(),  actionButton('report', "Download your report"), br(), br(),
                                  tags$div(
                                    tags$em("Check out ",
                                            tags$a(href="https://014gc.sharepoint.com/sites/CX-EC", 
                                                   "the CXSpace"), " for additional client resources such as journey mapping templates,", tags$a(href="https://014gc.sharepoint.com/sites/CX-EC/SitePages/CX%20Glossary.aspx", "CX glossary"), ", webinars and training.")),
                                  br()
                                ),
          
          
          
          ############################################################# FRENCH NEW INITIATIVE  ##########################################################
          
          
          conditionalPanel(
            condition = ("input.response1_f != 0 && input.back1_f != 1" ),
            width = 12, 
            actionButton("back1_f", "Retour"), br(),
            br(),
            h3("Planifier une nouvelle initiative", style = list('border-bottom-style: solid;', 'border-color: #248c84;')),
            br(),
            p(HTML(paste("Cette liste de v&eacute;rification fournit les pratiques cl&eacute;s en mati&egrave;re d'EC qu'il faut prendre en compte dans le cadre de votre planification initiale. Une fois remplie, vous pouvez l'utiliser comme point de discussion pour informer le personnel, les coll&egrave;gues ou la direction g&eacute;n&eacute;rale sur ce qui est n&eacute;cessaire pour adapter &agrave; votre initiative une approche ax&eacute;e sur le client."))),         
            br(),
            p("Avant de commencer, veuillez remplir le tableau ci-dessous, qui servira de documentation pour votre initiative."), br(),
            DT::dataTableOutput("ruless_f"), br(), br(),
            DT::dataTableOutput('tbl_a_f'),
            br(),
            actionButton("complete_f", HTML(paste("Compl&eacute;ter")), style='padding:12px; font-size:100%; font-weight: bold;'),
            br(), br(),
            
            uiOutput("warningai_f", style = ('font-size: 18px; font-weight: bold; color: black')), tags$head(tags$style("#text2{color: black;
                                 font-size: 22px;
                                 font-weight: bold;
                                 font-family: arial;
                                  padding-top:20px;
                                 padding-bottom:20px;
                                 padding-left: 0.5em;
                                 padding-right: 0.5em;
                                 }"
            )),
            
            uiOutput("warninga1_f", style = list('border-left-style: solid;', 'border-color: white;')),
            tags$head(tags$style("#warning2{color: black;
                                 font-size: 18px;
                                 font-weight: normal;
                                 font-family: arial;
                                 border-color: blue
                                 }")),
            uiOutput("warninga2_f", style = list('border-left-style: solid;', 'border-color: white;')),
            tags$head(tags$style("#warning2{color: black;
                                 font-size: 18px;
                                 font-weight: normal;
                                 font-family: arial;
                                 border-color: blue
                                 }")),
            uiOutput("warninga3_f", style = list('border-left-style: solid;', 'border-color: white;')),
            tags$head(tags$style("#warning2{color: black;
                                 font-size: 18px;
                                 font-weight: normal;
                                 font-family: arial;
                                 border-color: blue
                                 }")), br(), br(),  actionButton('report_f', HTML(paste("T&eacute;l&eacute;charger votre rapport"))), br(), br(),
            tags$div(
              tags$em("Consultez l'",
                      tags$a(href="https://014gc.sharepoint.com/sites/CX-EC", 
                             HTML(paste("espace exp&eacute;rience client"))), HTML(paste(" pour obtenir des ressources suppl&eacute;mentaires telles que des mod&egrave;les de planification des parcours,")), 
                             tags$a(href="https://014gc.sharepoint.com/sites/CX-EC/SitePages/CX%20Glossary.aspx", "un glossaire sur l'EC"), ", des webinaires et des cours de formation.")),
            br()
          ),
          
          
          ###################################################### EXISTING INITIATIVE   ################################################################################################# 
                               
                                conditionalPanel(
                                  condition = ("input.response2 != 0 && input.response1 == 0" ),
                                  actionButton("back2_f", "Back", onclick="location.href='http://esdc-cx-coe.eastus2.cloudapp.azure.com:3838/CX_Self-Assessment/';"), br(),
                                  width = 12,
                                  br(),
                                  h3("Leading an existing initiative", style = list('border-bottom-style: solid;', 'border-color: #248c84;')), 
                                  br(),
                                  p("This checklist will help assess the use of client insights and CX-related practices for your current initiative. Once completed, it will generate a score and indicate the CX practices you could further explore to make your initiative more client-centric. You can use your score as discussion points to inform staff, colleagues or senior management."),                           
                                  br(),
                                  p("Before you start, please fill out the table below, which will serve as your initiative documentation."), br(),
                                  DT::dataTableOutput("ruless_section2"), br(), br(),
                                  wp2,
                                  br(),
                                  DT::dataTableOutput('foo'),
                                  br(),
                                  wp3,
                                  br(),
                                  DT::dataTableOutput('foo2'),
                                  br(),
                                  wp4,
                                  br(),
                                  DT::dataTableOutput('foo3'),
                                  br(),
                                  wp5,
                                  br(),
                                  DT::dataTableOutput('foo4'),
                                  br(),
                                  actionButton("submit", "Get Results", style='padding:12px; font-size:100%; font-weight: bold'),
                                  br(),br(), 
                                  uiOutput("text1", style =list('border-top-style: solid;', 'border-color: #248c84;')), 
                                  tags$head(tags$style("#text1 {color: black;
                                 font-family: arial;
                                 padding-top:20px;
                                 padding-bottom:20px;
                                 padding-left: 0.5em;
                                 font-size:28px!important;
                                 }"
                                  )),
                                 br()
                                 
                                ), 
                                 conditionalPanel(
                                   condition = ("input.submit == 1"),
                                 
                                 br(),
                                  plotOutput("total", height = 600),
                                  uiOutput("text2", style =list('border-top-style: solid;', 'border-color: #248c84;')), tags$head(tags$style("#text2{color: black;
                                 font-size: 20px;
                                 font-weight: normal;
                                 color: black;
                                 font-family: arial;
                                  padding-top:20px;
                                 padding-bottom:20px;
                                 padding-left: 0.5em;
                                 padding-right: 0.5em;
                                 }"
                                  )),
                                  tags$head(tags$style("#resources{color: black;
                                 font-size: 22px;
                                 font-weight: bold;
                                 font-family: arial;
                                 padding-left: 0.5em;
                                 padding-right: 0.5em;
                                 }"
                                  )),
                                  
                                  
                                  uiOutput("warning2", style = 'padding-left:15px'),#, style = list('border-left-style: solid;','padding-left: 15px;', 'border-color: #ccccff;')),
                                  tags$head(tags$style("#warning2{color: black;
                                 font-size: 18px;
                                 font-weight: normal;
                                 font-family: arial;
                                 border-color: blue
                                 }")),
                                  
                                  uiOutput("warning4",style = 'padding-left:15px'),#, style = list('border-left-style: solid;','padding-left: 15px;', 'border-color: #ffe1e6;')),
                                  tags$head(tags$style("#warning4{color: black;
                                 font-size: 18px;
                                 font-weight: normal;
                                 font-family: arial;
                                 }
                          ")),
                                  uiOutput("warning3",style = 'padding-left:15px'),#, style = list('padding-left: 15px;', 'border-color: gold;')),
                                  tags$head(tags$style("#warning3{color: black;
                                 font-size: 18px;
                                 font-weight: normal;
                                 font-family: arial;
                                 }")),
                                  #plotOutput("ge", height = 200),
                                  uiOutput("warning1",style = 'padding-left:15px'),#, style = list('border-left-style: solid;', 'padding-left: 15px;', 'border-color: #89CFF0;')),
                                  tags$head(tags$style("#warning1{color: black;
                                 font-size: 18px;
                                 font-weight: normal;
                                 font-family: arial;
                                 }")),
                                  #plotOutput("ue", height = 200),
                                  br(),
                                  #textOutput("textbottom"), tags$a(href="https://014gc.sharepoint.com/sites/CX-EC", "CXSpace"),
                                  br(), 

                                  actionButton('report2', "Download your report"), br(), br(),
                                  #textOutput("table_ti2"),
                                  tags$div(
                                    tags$em("Check out ",
                                            tags$a(href="https://014gc.sharepoint.com/sites/CX-EC", 
                                                   "the CXSpace"), " for additional client resources such as journey mapping templates,", tags$a(href="https://014gc.sharepoint.com/sites/CX-EC/SitePages/CX%20Glossary.aspx", "CX glossary"), ", webinars and training.")),
                                  br()
                                
          ),
          
          ######################################################   FRENCH EXISTING INITIATIVE
          
          conditionalPanel(
            condition = ("input.response2_f != 0 && input.back2 !=1" ),
            width = 12,
            actionButton("back2", "Retour"), br(),
            br(),
            h3(HTML(paste("Diriger une initiative d&eacute;j&agrave; en cours")), style = list('border-bottom-style: solid;', 'border-color: #248c84;')), 
            br(),
            p(HTML(paste("Cette liste de v&eacute;rification vous aidera &agrave; &eacute;valuer l'utilisation des points de vue des clients et des pratiques li&eacute;es &agrave; l'EC pour votre initiative en cours. Une fois termin&eacute;, il produira un score et indiquera les pratiques en mati&egrave;re d'EC que vous pourriez explorer davantage pour rendre votre initiative plus centr&eacute;e sur le client. Vous pouvez utiliser votre score comme point de discussion pour informer le personnel, les coll&egrave;gues ou la direction."))),            
            br(),
            p("Avant de commencer, veuillez remplir le tableau ci-dessous, qui servira de documentation pour votre initiative."), br(),
            DT::dataTableOutput("ruless_2f"), br(), 
            h4(HTML(paste("LA PLANIFICATION AX&Eacute;E SUR LE CLIENT")), style = list("border-style: none;", "background: white;")),
            br(),
            DT::dataTableOutput('foo_f'),
            br(),
            h4(HTML(paste("LA CONCEPTION DE PROGRAMMES ET DE SERVICES"))),
            br(),
            DT::dataTableOutput('foo_f_2'),
            br(),
            h4(HTML(paste("LA MESURE DES R&#201;SULTATS EN MATI&#200;RE D'EC"))),
            br(),
            DT::dataTableOutput('foo_f_3'),
            br(),
            h4(HTML(paste("LE TRAVAIL SELON L'APPROCHE AX&#201;E SUR LA CLIENT&#200;LE"))),
            br(),
           DT::dataTableOutput('foo_f_4'),
             br(),
            actionButton("submit_f", HTML(paste("Obtenir des r&#233;sultats")), style='padding:12px; font-size:100%; font-weight: bold'),
            br(),br()),
          
          conditionalPanel(
            condition = ("input.submit_f == 1 && input.back2 !=1"),
            uiOutput("text1_f", style =list('border-top-style: solid;', 'border-color: #248c84;')), br(), br(),
            tags$head(tags$style("#text1_f {color: black;
                                 font-family: arial;
                                 padding-top:20px;
                                 padding-bottom:20px;
                                 padding-left: 0.5em;
                                 font-size: 20px;
                                 }"
            )),
            plotOutput("total_f", height = 600),
            uiOutput("text2_f", style =list('border-top-style: solid;', 'border-color: #248c84;')), tags$head(tags$style("#text2_f {color: black;
                                 font-size: 20px;
                                 font-weight: normal;
                                 font-family: arial;
                                  padding-top:30px;
                                 padding-bottom:20px;
                                 padding-left: 0.5em;
                                 padding-right: 0.5em;
                                 }"
            )),
            # tags$head(tags$style("#resources{color: black;
            #                      font-size: 22px;
            #                      font-weight: bold;
            #                      font-family: arial;
            #                      padding-left: 0.5em;
            #                      padding-right: 0.5em;
            #                      }"
            # )),
            # 
            # 
            uiOutput("warning2_f", style = 'padding-left:15px'),#, style = list('border-left-style: solid;','padding-left: 15px;', 'border-color: #ccccff;')),
            tags$head(tags$style("#warning2{color: black;
                                 font-size: 18px;
                                 font-weight: normal;
                                 font-family: arial;
                                 border-color: blue
                                 }")),

            uiOutput("warning4_f",style = 'padding-left:15px'),#, style = list('border-left-style: solid;','padding-left: 15px;', 'border-color: #ffe1e6;')),
            tags$head(tags$style("#warning4{color: black;
                                 font-size: 18px;
                                 font-weight: normal;
                                 font-family: arial;
                                 }
                          ")),
            uiOutput("warning3_f",style = 'padding-left:15px'),#, style = list('padding-left: 15px;', 'border-color: gold;')),
            tags$head(tags$style("#warning3{color: black;
                                 font-size: 18px;
                                 font-weight: normal;
                                 font-family: arial;
                                 }")),
            textOutput("warning1_f"),#, style = list('border-left-style: solid;', 'padding-left: 15px;', 'border-color: #89CFF0;')),
            tags$head(tags$style("#warning1{color: black;
                                 font-size: 18px;
                                 font-weight: normal;
                                 font-family: arial;
                                 }")),
            # 
            # br(),
            # br(), 
            # 
            # actionButton('report2', "Download your report"), br(), br(),
            # textOutput("table_ti2"),
            # tags$div(
            #   tags$em("Check out ",
            #           tags$a(href="https://014gc.sharepoint.com/sites/CX-EC", 
            #                  "the CXSpace"), " for additional client resources such as journey mapping templates,", tags$a(href="https://014gc.sharepoint.com/sites/CX-EC/SitePages/CX%20Glossary.aspx", "CX glossary"), ", webinars and training.")),
            br(), actionButton('report_f_2', HTML(paste("T&eacute;l&eacute;charger votre rapport"))),
           br(), br(),
           tags$div(
             tags$em("Consultez l'",
                     tags$a(href="https://014gc.sharepoint.com/sites/CX-EC", 
                            HTML(paste("espace exp&eacute;rience client"))), HTML(paste(" pour obtenir des ressources suppl&eacute;mentaires telles que des mod&egrave;les de planification des parcours,")), 
                     tags$a(href="https://014gc.sharepoint.com/sites/CX-EC/SitePages/CX%20Glossary.aspx", "un glossaire sur l'EC"), ", des webinaires et des cours de formation."))
          )
    
          )))),
  
  ###############################################################    SERVER - PROGRAM FUNCTIONALITY   ###################################################################################################################
  
  ######################################################################################################################################################################################################################
  
  
  server = function(input, output, session) {
    
    # observeEvent(input$english, {
    #   if (input$english == 1) {
    #     input$french = 0
    #   }
    # }
    #   )
    # 
    # observeEvent(input$french, {
    #   if (input$french == 1) {
    #     input$english = 0
    #   }
    # }
    #   )
      
      
    
    
    
    x <- data.table('For your initiative, did you...' = row_q, 'No' = rep(1,5), 'Yes' = rep(2,5), 
                    checked=c(rep("No",0),rep("Yes",0))) 
    
    x[, `No` := sprintf( '<input type="radio" name="%s" value="%s" %s/>', `For your initiative, did you...`, x[, `No`],ifelse("No"==x[, checked],"unchecked" ,"" ))]
    x[, `Yes` := sprintf( '<input type="radio" name="%s" value="%s" %s/>', `For your initiative, did you...`, x[, `Yes`] ,ifelse("Yes"==x[, checked],"checked" ,""))]
    
    
    output$foo = DT::renderDataTable(
      x[,-c("checked")], escape = FALSE, selection = 'none', server = FALSE, rownames=FALSE, colnames = c("For your current initiative, did you...", "No", "Yes"),
      caption = "Every client has their own journey. Knowing who your clients are and what they do, think and feel when they interact with ESDC will help in reaching your goals.",
      options = list(dom = 't', paging = FALSE, ordering = FALSE,  autoWidth = FALSE, 
                     columnDefs = list(list(Width = "130px", targets = 1))),
      callback = JS("table.rows().every(function(i, tab, row) {
                    var $this = $(this.node());
                    $this.attr('id', this.data()[0]);
                    $this.addClass('shiny-input-radiogroup');
  });
                    Shiny.unbindAll(table.table().node());
                    Shiny.bindAll(table.table().node());")
    )
    
    observeEvent(input$submit,{
      
      output$pe = renderPlot({
        y <- sapply(x$`For your initiative, did you...`, function(i) input[[i]])
        
          y2 <- as.numeric(gsub("([0-9]+).*$", "\\1", y))
          y2 <- y2-1
          y2[is.na(y2)]<- 0
        
              score <- round((sum(y2)/8)*100, 0)
              
              yy <- c('yy', 'yy')
              
              score <- c(score, (100-score))
              score <- data.frame(score, yy)
              score$fill <- c("#ccccff", 'NA')
        
                  p<-ggplot(score, aes(x=yy, y=score)) + geom_bar(position = "stack", stat = 'identity', color="black", fill = score$fill) + theme_minimal() + ggtitle("CLIENT-DRIVEN PLANNING") + ylim(c(0,100)) + 
                    theme(plot.title = element_text(size = 30, face = "bold")) + theme(axis.text=element_text(size=20, color = "black")) + 
                    theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())+ ylab("")#+ scale_y_continuous(labels = scales::percent_format(/100))
                  
                  p <- p + coord_flip() + annotate(
                    "text", label = paste0(score[1,1],"%"),
                    x = 1, y = 35, size = 30, colour = "black"
                  )
                  p
            })
    })
    
                            observeEvent(input$submit,{
                              output$results1 <- renderPrint({
                                y <- sapply(x$`For your initiative, did you...`, function(i) input[[i]])
                                y2 <- as.numeric(gsub("([0-9]+).*$", "\\1", y))
                                y2 <- y2-1
                                y2[is.na(y2)]<- 0
                                score <- round((sum(y2)/8)*100, 0)
                                score
                              })
                            })
   
                            
                            
                            ######################### FRENCH FIRST TABLE FOO  ########################################################################
                            
                            
                            
                            x_f <- data.table('For your initiative, did you...' = row_q, 'No' = rep(1,5), 'Yes' = rep(2,5), 
                                            checked=c(rep("No",0),rep("Yes",0)), row2 = row_q_f) 
                            
                            x_f[, `No` := sprintf( '<input type="radio" name="%s" value="%s" %s/>', `For your initiative, did you...`, x_f[, `No`],ifelse("No"==x_f[, checked],"unchecked" ,"" ))]
                            x_f[, `Yes` := sprintf( '<input type="radio" name="%s" value="%s" %s/>', `For your initiative, did you...`, x_f[, `Yes`] ,ifelse("Yes"==x_f[, checked],"checked" ,""))]
                            
                            x_f <- x_f[,c(1,5,2,3,4)]
                            
                            output$foo_f = DT::renderDataTable(
                              x_f[,-c("checked")], escape = FALSE, selection = 'none', server = FALSE, rownames=FALSE, colnames = c("Pour votre initiative en cours, avez-vous...","row2", "Non", "Oui"),
                              caption = HTML(paste("Chaque client a son propre parcours. Le fait de savoir qui sont vos clients et ce qu'ils font, pensent et ressentent lorsqu'ils interagissent avec EDSC vous aidera &#224; atteindre vos objectifs.")),
                              options = list(dom = 't', paging = FALSE, ordering = FALSE,  autoWidth = FALSE, 
                                             initComplete = JS(
                                               "function(settings, json) {",
                                               "$('td').css({'border': '1px solid black'});",
                                               "$('#foo_f th:nth-child(2)').remove();",
                                               "$('#foo_f tbody > tr:nth-child(1) > td:first-child').remove();",
                                               "$('#foo_f tbody > tr:nth-child(2) > td:first-child').remove();",
                                               "$('#foo_f tbody > tr:nth-child(3) > td:first-child').remove();",
                                               "$('#foo_f tbody > tr:nth-child(4) > td:first-child').remove();",
                                               "$('#foo_f tbody > tr:nth-child(5) > td:first-child').remove();",
                                               
                                               "$('th').css({'border': '1px solid black'}).css({'font-size': '18px'});",
                                               "$('td:nth-child(2)').css({'width': '100px'});",
                                               "$('#foo3 th:nth-child(2)').css({'background-color': '#FFB6C1'});",
                                               "$('#foo3 th:nth-child(3)').css({'background-color': '#ace1af'});",
                                               "$('th').css({'line-height': '40px'});",
                                               "$('th:first-child').css({'text-indent': '-5px'});",
                                               "$('tr:nth-child(1)').css({'color': 'black'});",
                                               "$('tr:nth-child(2)').css({'color': 'black'});",
                                               "$('tr:nth-child(3)').css({'color': 'black'});",
                                               "$('tr:nth-child(4)').css({'color': 'black'});",
                                               "$('tr:nth-child(5)').css({'color': 'black'});",
                                               "}")),
                              callback = JS("table.rows().every(function(i, tab, row) {
                    var $this = $(this.node());
                    $this.attr('id', this.data()[0]);
                    $this.addClass('shiny-input-radiogroup');
  });
                    Shiny.unbindAll(table.table().node());
                    Shiny.bindAll(table.table().node());")
                            )
                            
                            observeEvent(input$submit_f,{
                              
                              output$pe = renderPlot({
                                y <- sapply(x_f$`For your initiative, did you...`, function(i) input[[i]])
                                
                                y2 <- as.numeric(gsub("([0-9]+).*$", "\\1", y))
                                y2 <- y2-1
                                y2[is.na(y2)]<- 0
                                
                                score <- round((sum(y2)/8)*100, 0)
                                
                                yy <- c('yy', 'yy')
                                
                                score <- c(score, (100-score))
                                score <- data.frame(score, yy)
                                score$fill <- c("#ccccff", 'NA')
                                
                                p<-ggplot(score, aes(x=yy, y=score)) + geom_bar(position = "stack", stat = 'identity', color="black", fill = score$fill) + theme_minimal() + ggtitle("CLIENT-DRIVEN PLANNING") + ylim(c(0,100)) + 
                                  theme(plot.title = element_text(size = 30, face = "bold")) + theme(axis.text=element_text(size=20, color = "black")) + 
                                  theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())+ ylab("")#+ scale_y_continuous(labels = scales::percent_format(/100))
                                
                                p <- p + coord_flip() + annotate(
                                  "text", label = paste0(score[1,1],"%"),
                                  x = 1, y = 35, size = 30, colour = "black"
                                )
                                p
                              })
                            })
                            
                            observeEvent(input$submit_f,{
                              output$results1 <- renderPrint({
                                y <- sapply(x_f$`For your initiative, did you...`, function(i) input[[i]])
                                y2 <- as.numeric(gsub("([0-9]+).*$", "\\1", y))
                                y2 <- y2-1
                                y2[is.na(y2)]<- 0
                                score <- round((sum(y2)/8)*100, 0)
                                score
                              })
                            })
                            
                            
                            
                            
                            observeEvent(input$submit_f,{
                              output$warning2_f <- renderUI({
                                y <- sapply(x_f$`For your initiative, did you...`, function(i) input[[i]])
                                
                                y2 <- as.numeric(gsub("([0-9]+).*$", "\\1", y))
                                y2 <- y2-1
                                y2[is.na(y2)]<- 0
                                
                                score <- round((sum(y2)/5)*100, 0)
                                warning = "For guidance on client-driven planning, please consult the following: IDEO Design Kit - The Field Guide to Human-Centered Design." 
                                
                                
                                if (score != 100) {
                                  
                                  div(HTML("<p><b>La planification ax&#233;e sur le client</b><li><a href='https://esdc.prv/fr/service-canada/csb/client-experience-survey.shtml'> R&#233;sultats du sondage sur l'EC men&#233; par EDSC</a></li><li><a href='https://esdc.prv/fr/service-canada/csb/sd/cfce.shtml'> Centre d'expertise de la r&#233;troaction des clients</a></li></p>"))
                                  
                                } else{
                                  
                                  invisible('')
                                  
                                }
                                
                                
                              }
                              )
                            })
                            
                            
                            
                             
    ############## second table   ############################
    
    x2 <- data.table('For your initiative, did you...' = row_q2, `No` = rep(1,4), "Yes" = rep(2,4), 
                     checked=c(rep("No",0),rep("Yes",0)))
    
    x2[, `No` := sprintf( '<input type="radio" name="%s" value="%s" %s/>', `For your initiative, did you...`, x2[, `No`],ifelse("No"==x2[, checked],"unchecked" ,"" ))]
    x2[, `Yes` := sprintf( '<input type="radio" name="%s" value="%s" %s/>', `For your initiative, did you...`, x2[, `Yes`] ,ifelse("Yes"==x2[, checked],"checked" ,""))]
    
    
    output$foo2 = renderDataTable(
      x2[,-c("checked")], escape = FALSE, selection = 'none', server = FALSE, rownames=FALSE, colnames = c("For your current initiative, did you...", "No", "Yes"),
      caption = "To create meaningful interactions, you need to use client insights as part of your program or service design.",
      options = list(dom = 't', paging = FALSE, ordering = FALSE, autoWidth = FALSE,
                     columnDefs = list(list(Width = "130px", targets = 1))),
      callback = JS("table.rows().every(function(i, tab, row) {
                    var $this = $(this.node());
                    $this.attr('id', this.data()[0]);
                    $this.addClass('shiny-input-radiogroup');
  });
                    Shiny.unbindAll(table.table().node());
                    Shiny.bindAll(table.table().node());")
    )
    
    observeEvent(input$submit_f,{
      output$fe = renderPlot({
        v <- sapply(x2$`For your initiative, did you...`, function(i) input[[i]])
        v2 <- as.numeric(gsub("([0-9]+).*$", "\\1", v))
        v2 <- v2-1
        v2[is.na(v2)]<- 0
        score <- round((sum(v2)/8)*100, 0)
        score
        
          yy <- c('yy', 'yy')
          
          score <- c(score, (100-score))
          score <- data.frame(score, yy)
          score$fill <- c("yellow", 'NA')
        
              p<-ggplot(score, aes(x=yy, y=score)) + geom_bar(position = "stack", stat = 'identity', color="black", fill = score$fill) + theme_minimal() + ggtitle("DESIGNING PROGRAMS AND SERVICES") + ylim(c(0,100)) + 
                theme(plot.title = element_text(size = 30, face = "bold")) + theme(axis.text=element_text(size=20, color = "black")) + 
                theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())+ ylab("")#+ scale_y_continuous(labels = scales::percent_format(/100))
              
              p <- p + coord_flip() + annotate(
                "text", label = paste0(score[1,1],"%"),
                x = 1, y = 35, size = 30, colour = "black"
              )
              p
      })
    })
    
    
    
            observeEvent(input$submit,{
              output$warning4 <- renderUI({
                y <- sapply(x2$`For your initiative, did you...`, function(i) input[[i]])
                
                y2 <- as.numeric(gsub("([0-9]+).*$", "\\1", y))
                y2 <- y2-1
                y2[is.na(y2)]<- 0
                
                score <- round((sum(y2)/5)*100, 0)
                warning = "For guidance on designing programs and services, please consult the following: Treasury Board - Government of Canada Policy on Service and Digital." 
                # warning = paste0("<a href='",dt$links,"</a>")
                
                if (score != 100) {
                  
                  #div(HTML("<p><li>For guidance on designing programs and services, please consult the following: <a href='http://esdc.prv/en/department/service-strategy/solutions/ccp/index.shtml'>Treasury Board - Government of Canada Policy on Service and Digital.</a></p></li>"))
                  div(HTML("<p><b>Designing programs and services</b><li><a href='https://ceacs-cesca.github.io/playbook/play4/'> AccessAbility Playbook: Barrier-free access for everyone</a></li><li><a href='https://esdc.prv/en/department/ibp/documents/sf.pdf'>ESDC's CX goals</a></li></p>"))
                } else{
                  
                  invisible('')
                  
                }
      }
      )
    })
    
            ############################################     FRENCH FOO TABLE 2
            
            x2_f <- data.table('For your initiative, did you...' = row_q2, `No` = rep(1,4), "Yes" = rep(2,4), 
                             checked=c(rep("No",0),rep("Yes",0)), row2 = row_q_f_2)
            
            x2_f[, `No` := sprintf( '<input type="radio" name="%s" value="%s" %s/>', `For your initiative, did you...`, x2_f[, `No`],ifelse("No"==x2_f[, checked],"unchecked" ,"" ))]
            x2_f[, `Yes` := sprintf( '<input type="radio" name="%s" value="%s" %s/>', `For your initiative, did you...`, x2_f[, `Yes`] ,ifelse("Yes"==x2_f[, checked],"checked" ,""))]
            
            x2_f <- x2_f[,c(1,5,2,3,4)]
            
            output$foo_f_2 = renderDataTable(
              x2_f[,-c("checked")], escape = FALSE, selection = 'none', server = FALSE, rownames=FALSE, colnames = c("Pour votre initiative en cours, avez-vous...", "row2", "Non", "Oui"),
              caption = HTML(paste("Pour cr&#233;er des interactions significatives, vous devez utiliser les points de vue des clients dans la conception de vos programmes ou services.")),
              options = list(dom = 't', paging = FALSE, ordering = FALSE, autoWidth = FALSE,
                             columnDefs = list(list(Width = "130px", targets = 1)),
              initComplete = JS(
                "function(settings, json) {",
                "$('td').css({'border': '1px solid black'});",
                "$('#foo_f_2 th:nth-child(2)').remove();",
                "$('#foo_f_2 tbody > tr:nth-child(1) > td:first-child').remove();",
                "$('#foo_f_2 tbody > tr:nth-child(2) > td:first-child').remove();",
                "$('#foo_f_2 tbody > tr:nth-child(3) > td:first-child').remove();",
                "$('#foo_f_2 tbody > tr:nth-child(4) > td:first-child').remove();",
                "$('#foo_f_2 tbody > tr:nth-child(5) > td:first-child').remove();",
                "$('th').css({'border': '1px solid black'}).css({'font-size': '18px'});",
                "$('td:nth-child(2)').css({'width': '100px'});",
                "$('#foo3 th:nth-child(2)').css({'background-color': '#FFB6C1'});",
                "$('#foo3 th:nth-child(3)').css({'background-color': '#ace1af'});",
                "$('th').css({'line-height': '40px'});",
                "$('th:first-child').css({'text-indent': '-5px'});",
                "$('tr:nth-child(1)').css({'color': 'black'});",
                "$('tr:nth-child(2)').css({'color': 'black'});",
                "$('tr:nth-child(3)').css({'color': 'black'});",
                "$('tr:nth-child(4)').css({'color': 'black'});",
                "$('tr:nth-child(5)').css({'color': 'black'});",
                "}")),
              callback = JS("table.rows().every(function(i, tab, row) {
                    var $this = $(this.node());
                    $this.attr('id', this.data()[0]);
                    $this.addClass('shiny-input-radiogroup');
  });
                    Shiny.unbindAll(table.table().node());
                    Shiny.bindAll(table.table().node());")
            )
            
            
            observeEvent(input$submit_f,{
              output$fe = renderPlot({
                v <- sapply(x2_f$`For your initiative, did you...`, function(i) input[[i]])
                v2 <- as.numeric(gsub("([0-9]+).*$", "\\1", v))
                v2 <- v2-1
                v2[is.na(v2)]<- 0
                score <- round((sum(v2)/8)*100, 0)
                score
                
                yy <- c('yy', 'yy')
                
                score <- c(score, (100-score))
                score <- data.frame(score, yy)
                score$fill <- c("yellow", 'NA')
                
                p<-ggplot(score, aes(x=yy, y=score)) + geom_bar(position = "stack", stat = 'identity', color="black", fill = score$fill) + theme_minimal() + ggtitle("DESIGNING PROGRAMS AND SERVICES") + ylim(c(0,100)) + 
                  theme(plot.title = element_text(size = 30, face = "bold")) + theme(axis.text=element_text(size=20, color = "black")) + 
                  theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())+ ylab("")#+ scale_y_continuous(labels = scales::percent_format(/100))
                
                p <- p + coord_flip() + annotate(
                  "text", label = paste0(score[1,1],"%"),
                  x = 1, y = 35, size = 30, colour = "black"
                )
                p
              })
            })
            
            
            
            observeEvent(input$submit_f,{
              output$warning4_f <- renderUI({
                y <- sapply(x2_f$`For your initiative, did you...`, function(i) input[[i]])
                
                y2 <- as.numeric(gsub("([0-9]+).*$", "\\1", y))
                y2 <- y2-1
                y2[is.na(y2)]<- 0
                
                score <- round((sum(y2)/5)*100, 0)
                warning = "For guidance on designing programs and services, please consult the following: Treasury Board - Government of Canada Policy on Service and Digital." 
                # warning = paste0("<a href='",dt$links,"</a>")
                
                if (score != 100) {
                  
                  #div(HTML("<p><li>For guidance on designing programs and services, please consult the following: <a href='http://esdc.prv/en/department/service-strategy/solutions/ccp/index.shtml'>Treasury Board - Government of Canada Policy on Service and Digital.</a></p></li>"))
                  div(HTML("<p><b>La conception de programmes et de services</b><li><a href='https://ceacs-cesca.github.io/playbook/play4/index-fr.html'> Guide de l'accessibilit&#233; : Concevoir des exp&#233;riences plus inclusives</a></li><li><a href='http://esdc.prv/fr/department/service-strategy/solutions/ccp/index.shtml'> Conseil du Tr&#233;sor - Politique sur les services et le num&#233;rique du gouvernement du Canada (check)</a></li></p>"))
                } else{
                  
                  invisible('')
                  
                }
              }
              )
            })
            
            
            
            
    ################### third table   ###########################################################################################################
            
    x3 <- data.table('For your initiative, did you...' = row_q3, 'No' = rep(1,3), 'Yes' = rep(2,3), 
                     checked=c(rep("No",0),rep("Yes",0))
    )
    headernew <- c("To ensure you are delivering the outcomes you had in mind for your clients, measure how they perceived their CX.", "a", "b","c")
    
    x3[, `No` := sprintf( '<input type="radio" name="%s" value="%s" %s/>', `For your initiative, did you...`, x3[, `No`],ifelse("No"==x3[, checked],"unchecked" ,"" ))]
    x3[, `Yes` := sprintf( '<input type="radio" name="%s" value="%s" %s/>', `For your initiative, did you...`, x3[, `Yes`] ,ifelse('Yes'==x3[, checked],"checked" ,""))]
    
    output$foo3 = renderDataTable(
      x3[,-c("checked")], escape = FALSE, selection = 'none', server = FALSE, rownames=FALSE, colnames = c("For your current initiative, did you...", "No", "Yes"),
      caption = "To ensure you are delivering the outcomes you had in mind for your clients, measure how they perceived their CX.",
      options = list(dom = 't', paging = FALSE, ordering = FALSE, autoWidth = FALSE,
                     columnDefs = list(list(Width = "130px", targets = 1)), initComplete = JS(
                       "function(settings, json) {",
                       "$('td').css({'border': '1px solid black'});",
                       "$('th').css({'border': '1px solid black'}).css({'font-size': '18px'});",
                       "$('td:nth-child(2)').css({'width': '100px'});",
                       "$('#foo3 th:nth-child(2)').css({'background-color': '#FFB6C1'});",
                       "$('#foo3 th:nth-child(3)').css({'background-color': '#ace1af'});",
                       "$('th').css({'line-height': '40px'});",
                       "$('th:first-child').css({'text-indent': '-5px'});",
                       "$('tr:nth-child(1)').css({'color': 'black'});",
                       "$('tr:nth-child(2)').css({'color': 'black'});",
                       "$('tr:nth-child(3)').css({'color': 'black'});",
                       "$('tr:nth-child(4)').css({'color': 'black'});",
                       "$('tr:nth-child(5)').css({'color': 'black'});",
                       "}")),
      callback = JS("table.rows().every(function(i, tab, row) {
                    var $this = $(this.node());
                    $this.attr('id', this.data()[0]);
                    $this.addClass('shiny-input-radiogroup');
  });
                    Shiny.unbindAll(table.table().node());
                    Shiny.bindAll(table.table().node());")
    )
    
    observeEvent(input$submit,{
      output$ge = renderPlot({
            vt3 <- sapply(x3$`For your initiative, did you...`, function(i) input[[i]])
            vt3 <- as.numeric(gsub("([0-9]+).*$", "\\1", vt3))
            vt3[is.na(vt3)]<- 0
            #vt3 <- vt3+1
            #score <- round((sum(vt3))*100, 0)
            score <- sum(vt3*3)
            yy <- c('yy', 'yy')
            
            #score <- 20
            score <- c(score, (100-score))
            score <- data.frame(score, yy)
            score$fill <- c("yellow", 'NA')
        
                  p<-ggplot(score, aes(x=yy, y=score)) + geom_bar(position = "stack", stat = 'identity', color="black", fill = score$fill) + theme_minimal() + ggtitle("MEASURING CX OUTCOMES") + ylim(c(0,100)) + 
                    theme(plot.title = element_text(size = 30, face = "bold")) + theme(axis.text=element_text(size=20, color = "black")) + 
                    theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())+ ylab("")#+ scale_y_continuous(labels = scales::percent_format(/100))
                  
                  p <- p + coord_flip() + annotate(
                    "text", label = paste0(score[1,1],"%"),
                    x = 1, y = 35, size = 30, colour = "black"
                  )
                  p
             })
    })
    
    
                      observeEvent(input$submit,{
                        output$warning3 <- renderUI({
                          vt4 <- sapply(x3$`For your initiative, did you...`, function(i) input[[i]])
                          vt4 <- as.numeric(gsub("([0-9]+).*$", "\\1", vt4))
                          vt4 <- vt4-1
                          vt4[is.na(vt4)]<- 0
                          score <- round((sum(vt4)/3)*100, 0)
                          
                          if (score != 100) {
                            
                            div(HTML("<p><b>Measuring CX outcomes</b><li><a href='http://esdc.prv/en/department/service-strategy/solutions/ccp/index.shtml'> Treasury Board - Government of Canada Policy on Service and Digital</a></li></p>"))
                                
                          } else{
                            
                            invisible('')
                            
                          }
      }
      )
    })
    
    
                      
    ##############################  FRENCH FOO TABLE 3 ######################################################################################
                      
                      x3_f <- data.table('For your initiative, did you...' = row_q3, 'No' = rep(1,3), 'Yes' = rep(2,3), 
                                       checked=c(rep("No",0),rep("Yes",0)),row2 = row_q_f_3)
                      

                      x3_f[, `No` := sprintf( '<input type="radio" name="%s" value="%s" %s/>', `For your initiative, did you...`, x3_f[, `No`],ifelse("No"==x3_f[, checked],"unchecked" ,"" ))]
                      x3_f[, `Yes` := sprintf( '<input type="radio" name="%s" value="%s" %s/>', `For your initiative, did you...`, x3_f[, `Yes`] ,ifelse('Yes'==x3_f[, checked],"checked" ,""))]
                      
                      x3_f <- x3_f[,c(1,5,2,3,4)]
                      
                      output$foo_f_3 = renderDataTable(
                        x3_f[,-c("checked")], escape = FALSE, selection = 'none', server = FALSE, rownames=FALSE, colnames = c("Pour votre initiative en cours, avez-vous...", "row2", "Non", "Oui"),
                        caption = HTML(paste("Pour vous assurer que vous obtenez les r&#233;sultats escompt&#233;s pour vos clients, mesurez leur impression de leur EC.")),
                        options = list(dom = 't', paging = FALSE, ordering = FALSE, autoWidth = FALSE,
                                       columnDefs = list(list(Width = "130px", targets = 1)), initComplete = JS(
                                         "function(settings, json) {",
                                         "$('td').css({'border': '1px solid black'});",
                                         "$('#foo_f_3 th:nth-child(2)').remove();",
                                         "$('#foo_f_3 tbody > tr:nth-child(1) > td:first-child').remove();",
                                         "$('#foo_f_3 tbody > tr:nth-child(2) > td:first-child').remove();",
                                         "$('#foo_f_3 tbody > tr:nth-child(3) > td:first-child').remove();",
                                         "$('#foo_f_3 tbody > tr:nth-child(4) > td:first-child').remove();",
                                         "$('th').css({'border': '1px solid black'}).css({'font-size': '18px'});",
                                         "$('td:nth-child(2)').css({'width': '100px'});",
                                         "$('#foo3 th:nth-child(2)').css({'background-color': '#FFB6C1'});",
                                         "$('#foo3 th:nth-child(3)').css({'background-color': '#ace1af'});",
                                         "$('th').css({'line-height': '40px'});",
                                         "$('th:first-child').css({'text-indent': '-5px'});",
                                         "$('tr:nth-child(1)').css({'color': 'black'});",
                                         "$('tr:nth-child(2)').css({'color': 'black'});",
                                         "$('tr:nth-child(3)').css({'color': 'black'});",
                                         "$('tr:nth-child(4)').css({'color': 'black'});",
                                         "$('tr:nth-child(5)').css({'color': 'black'});",
                                         "}")),
                        callback = JS("table.rows().every(function(i, tab, row) {
                    var $this = $(this.node());
                    $this.attr('id', this.data()[0]);
                    $this.addClass('shiny-input-radiogroup');
  });
                    Shiny.unbindAll(table.table().node());
                    Shiny.bindAll(table.table().node());")
                      )
                      
                      observeEvent(input$submit_f,{
                        output$ge = renderPlot({
                          vt3 <- sapply(x3_f$`For your initiative, did you...`, function(i) input[[i]])
                          vt3 <- as.numeric(gsub("([0-9]+).*$", "\\1", vt3))
                          vt3[is.na(vt3)]<- 0
                          #vt3 <- vt3+1
                          #score <- round((sum(vt3))*100, 0)
                          score <- sum(vt3*3)
                          yy <- c('yy', 'yy')
                          
                          #score <- 20
                          score <- c(score, (100-score))
                          score <- data.frame(score, yy)
                          score$fill <- c("yellow", 'NA')
                          
                          p<-ggplot(score, aes(x=yy, y=score)) + geom_bar(position = "stack", stat = 'identity', color="black", fill = score$fill) + theme_minimal() + ggtitle("MEASURING CX OUTCOMES") + ylim(c(0,100)) + 
                            theme(plot.title = element_text(size = 30, face = "bold")) + theme(axis.text=element_text(size=20, color = "black")) + 
                            theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())+ ylab("")#+ scale_y_continuous(labels = scales::percent_format(/100))
                          
                          p <- p + coord_flip() + annotate(
                            "text", label = paste0(score[1,1],"%"),
                            x = 1, y = 35, size = 30, colour = "black"
                          )
                          p
                        })
                      })
                      
                      
                      observeEvent(input$submit_f,{
                        output$warning3_f <- renderUI({
                          vt4 <- sapply(x3_f$`For your initiative, did you...`, function(i) input[[i]])
                          vt4 <- as.numeric(gsub("([0-9]+).*$", "\\1", vt4))
                          vt4 <- vt4-1
                          vt4[is.na(vt4)]<- 0
                          score <- round((sum(vt4)/3)*100, 0)
                          
                          if (score != 100) {
                            
                            div(HTML("<p><b>La mesure des r&#233;sultats en mati&#232;re d'EC</b><li><a href='http://esdc.prv/fr/department/service-strategy/solutions/ccp/index.shtml'> Conseil du Tr&#233;sor - Politique sur les services et le num&#233;rique du gouvernement du Canada</a></li></p>"))
                            
                          } else{
                            
                            invisible('')
                            
                          }
                        }
                        )
                      })
                      
                      
                      
                      
    
    ################### fourth table   #######################################################################################################
                      
    x4 <- data.table('For your initiative, did you...' = row_q4, 'No' = rep(1,4), "Yes" = rep(2,4),  
                     checked=c(rep("No",0),rep("Yes",0)))
    
    x4[, `No` := sprintf( '<input type="radio" name="%s" value="%s" %s/>', `For your initiative, did you...`, x4[, `No`],ifelse("No"==x4[, checked],"unchecked" ,"" ))]
    x4[, `Yes` := sprintf( '<input type="radio" name="%s" value="%s" %s/>', `For your initiative, did you...`, x4[, `Yes`] ,ifelse("Yes"==x4[, checked],"checked" ,""))]
    
    
    output$foo4 = renderDataTable(
      x4[,-c("checked")], escape = FALSE, selection = 'none', server = FALSE, rownames=FALSE, colnames = c("For your current initiative, did you...", "No", "Yes"),
      caption = "Base all your decisions on the positive impact they will have on the CX.",
      options = list(dom = 't', paging = FALSE, ordering = FALSE, autoWidth = FALSE,
                     columnDefs = list(list(Width = "130px", targets = 1)), initComplete = JS(
                       "function(settings, json) {",
                       "$('td').css({'border': '1px solid black'});",
                       "$('th').css({'border': '1px solid black'}).css({'font-size': '18px'});",
                       "$('td:nth-child(2)').css({'width': '100px'});",
                       "$('th:nth-child(2)').css({'background-color': '#FFB6C1'});",
                       "$('th:nth-child(3)').css({'background-color': '#ace1af'});",
                       "$('th').css({'line-height': '40px'});",
                       "$('th:first-child').css({'text-indent': '-5px'});",
                       "$('tr:nth-child(1)').css({'color': 'black'});",
                       "$('tr:nth-child(2)').css({'color': 'black'});",
                       "$('tr:nth-child(3)').css({'color': 'black'});",
                       "$('tr:nth-child(4)').css({'color': 'black'});",
                       "$('tr:nth-child(5)').css({'color': 'black'});",
                       "}")),
      callback = JS("table.rows().every(function(i, tab, row) {
                    var $this = $(this.node());
                    $this.attr('id', this.data()[0]);
                    $this.addClass('shiny-input-radiogroup');
  });
                    Shiny.unbindAll(table.table().node());
                    Shiny.bindAll(table.table().node());")
    )
    
    observeEvent(input$submit,{
      output$ue = renderPlot({
            vt4 <- sapply(x4$`For your initiative, did you...`, function(i) input[[i]])
            vt4 <- as.numeric(gsub("([0-9]+).*$", "\\1", vt4))
            vt4 <- vt4-1
            vt4[is.na(vt4)]<- 0
            score <- round((sum(vt4)/8)*100, 0)
            yy <- c('yy', 'yy')
            
            #score <- 20
            score <- c(score, (100-score))
            score <- data.frame(score, yy)
            score$fill <- c("yellow", 'NA')
        
                    p<-ggplot(score, aes(x=yy, y=score)) + geom_bar(position = "stack", stat = 'identity', color="black", fill = score$fill) + theme_minimal() + ggtitle("WORKING IN A CLIENT-CENTRIC WAY") + ylim(c(0,100)) + 
                      theme(plot.title = element_text(size = 30, face = "bold")) + theme(axis.text=element_text(size=20, color = "black")) + 
                      theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())+ ylab("")#+ scale_y_continuous(labels = scales::percent_format(/100))
                    
                    p <- p + coord_flip() + annotate(
                      "text", label = paste0(score[1,1],"%"),
                      x = 1, y = 35, size = 30, colour = "black"
                    )
                    p
      })           
      
    })    
    
                  observeEvent(input$submit,{
                    output$warning1 <- renderUI({
                      vt4 <- sapply(x4$`For your initiative, did you...`, function(i) input[[i]])
                      vt4 <- as.numeric(gsub("([0-9]+).*$", "\\1", vt4))
                      vt4 <- vt4-1
                      vt4[is.na(vt4)]<- 0
                      score <- round((sum(vt4)/4)*100, 0)

                      if (score != 100) {
                        
                        div(HTML("<p><b>Working in a client-centric way</b><li><a href='http://esdc.prv/en/department/service-strategy/solutions/ccp/index.shtml'> ESDC Client Centric Policy Playbook 1.0</a></li></p>"))
                        
                      } else{
                        
                        invisible('')
                        
                      }
                    }
                    )
    })
    
                  
     ########################################     FRENCH FOO TABLE 4  ####################################################################             
    
                  x4_f <- data.table('For your initiative, did you...' = row_q4, 'Non' = rep(1,4), "Yes" = rep(2,4),
                                   checked=c(rep("Non",0),rep("Yes",0)), row2 = row_q_f_4)
                  
                  x4_f[, `Non` := sprintf( '<input type="radio" name="%s" value="%s" %s/>', `For your initiative, did you...`, x4_f[, `Non`],ifelse("Non"==x4_f[, checked],"unchecked" ,"" ))]
                  x4_f[, `Yes` := sprintf( '<input type="radio" name="%s" value="%s" %s/>', `For your initiative, did you...`, x4_f[, `Yes`] ,ifelse("Yes"==x4_f[, checked],"checked" ,""))]
                 # x4_f[,1]<- row_q_f_4
                  #x4_f <- x4_f[,c(5,2,3,4,1)]
                  x4_f <- x4_f[,c(1,5,2,3,4)]
                  #Encoding(x4_f[,1]) <- "UTF-8"
                  
                  output$foo_f_4 = renderDataTable(
                    
                    
                    
                    x4_f[,-("checked")], escape = FALSE, selection = 'none', server = FALSE, rownames=FALSE, colnames = c("Pour votre initiative en cours, avez-vous...", "row2", "Non", "Oui"),
                    caption = HTML(paste("Basez toutes vos d&#233;cisions sur les r&#233;percussions positives qu'elles auront sur l'EC.")),
                    options = list(dom = 't', paging = FALSE, ordering = FALSE, autoWidth = FALSE, 
                                   columnDefs = list(list(Width = "130px", targets = 1)), initComplete = JS(
                                     "function(settings, json) {",
                                     "$('td').css({'border': '1px solid black'});",
                                     "$('#foo_f_4 th:nth-child(2)').remove();",
                                     "$('#foo_f_4 tbody > tr:nth-child(1) > td:first-child').remove();",
                                     "$('#foo_f_4 tbody > tr:nth-child(2) > td:first-child').remove();",
                                     "$('#foo_f_4 tbody > tr:nth-child(3) > td:first-child').remove();",
                                     "$('#foo_f_4 tbody > tr:nth-child(4) > td:first-child').remove();",
                                     "$('th').css({'border': '1px solid black'}).css({'font-size': '18px'});",
                                     "$('td:nth-child(2)').css({'width': '100px'});",
                                     "$('th:nth-child(2)').css({'background-color': '#FFB6C1'});",
                                     "$('th:nth-child(3)').css({'background-color': '#ace1af'});",
                                     "$('th').css({'line-height': '40px'});",
                                     "$('th:first-child').css({'text-indent': '-5px'});",
                                     "$('tr:nth-child(1)').css({'color': 'black'});",
                                     "$('tr:nth-child(2)').css({'color': 'black'});",
                                     "$('tr:nth-child(3)').css({'color': 'black'});",
                                     "$('tr:nth-child(4)').css({'color': 'black'});",
                                     "$('tr:nth-child(5)').css({'color': 'black'});",
                                     "}")),
                    callback = JS("table.rows().every(function(i, tab, row) {
                    var $this = $(this.node());
                    $this.attr('id', this.data()[0]);
                    $this.addClass('shiny-input-radiogroup');
  });
                    Shiny.unbindAll(table.table().node());
                    Shiny.bindAll(table.table().node());")
                  )
                  
                 
                  # output$list_results <- renderText({
                  # list_results2 <- reactive({
                  #   list_values <- list()
                  #   for (i in unique(x4_f$rowid)) {
                  #     list_values[[i]] <- paste0(i, ": ", input[[i]])
                  # 
                  #   }
                  #   list_values
                  # })
                  # })

                  observeEvent(input$submit_f,{
                    output$warning1_f <- renderText({
                      #sapply(x4_f$rowid, function(i) input[[i]])
                      ####input$`For your initiative, did you...`[1]
                      #x4_f$`For your initiative, did you...`
                      #c(1,2,3)
                      #vt4 <- input$x4_f[1]
                      #NN <- input$Non_1
                      #NN <- as.character(NN)
                      #NN
                      ##input$rowid
                      #c(vt4)
                      #print(vt4)
                      #~return(vt4)
                      #print("whatsd")
                      # vt4 <- as.numeric(gsub("([0-9]+).*$", "\\1", vt4))
                      # vt4 <- vt4-1
                      # vt4[is.na(vt4)]<- 0
                      # score <- round((sum(vt4)/4)*100, 0)
                      # 
                      # if (score != 100) {
                      #   
                      #   div(HTML("<p><b>Working in a client-centric way</b><li><a href='http://esdc.prv/en/department/service-strategy/solutions/ccp/index.shtml'> ESDC Client Centric Policy Playbook 1.0</a></li></p>"))
                      #   
                      # } else{
                      #   
                      #   invisible('')
                      #   
                      # }
                    }
                    )
                  })                          
                  
        ##########################################################  total score plots output   #############################################################          
                  
    observeEvent(input$submit,{
      output$sum <- renderPrint({
        sum(c(as.numeric(input$results), as.numeric(input$results1)))
      })})
    
    observeEvent(input$submit,{
      output$total = renderPlot({
        y <- sapply(x$`For your initiative, did you...`, function(i) input[[i]])
        y2 <- as.numeric(gsub("([0-9]+).*$", "\\1", y))
        y2 <- y2-1
        y2[is.na(y2)]<- 0
        
        score1 <- round((sum(y2)/5)*100, 0)
        
        v <- sapply(x2$`For your initiative, did you...`, function(i) input[[i]])
        v2 <- as.numeric(gsub("([0-9]+).*$", "\\1", v))
        v2 <- v2-1
        v2[is.na(v2)]<- 0
        score2 <- round((sum(v2)/5)*100, 0)
        
        vt3 <- sapply(x3$`For your initiative, did you...`, function(i) input[[i]])
        vt3 <- as.numeric(gsub("([0-9]+).*$", "\\1", vt3))
        vt3 <- vt3-1
        vt3[is.na(vt3)]<- 0
        score3 <- round((sum(vt3)/3)*100, 0)
        
        vt4 <- sapply(x4$`For your initiative, did you...`, function(i) input[[i]])
        vt4 <- as.numeric(gsub("([0-9]+).*$", "\\1", vt4))
        vt4 <- vt4-1
        vt4[is.na(vt4)]<- 0
        score4 <- round((sum(vt4)/4)*100, 0)  
        
        total <- mean(c(score1, score2, score3,score4))
        
        score <- c(total, 100-total)
        ot <- c("s", "f")
        fill1 <- c("red", "NA")
        
        dat <- data.frame(score, ot, fill1)
        
        
        number <- paste0(round(dat[1,1], 0), "%.")
        
  
       sentence <- paste0("Your initiative scored an overall ", number)
        
        plt <- ggplot(dat, aes(x = 1, y = score, fill = fill1)) + geom_bar(width = 1, stat = "identity", col = 1) + scale_fill_manual(values = c("gray94", 'light green'))+ 
          coord_polar(theta = "y") + xlim(-0.7, 1.5) #+
        labs(x = NULL, y = NULL) + 
          theme(axis.ticks=element_blank(),
                axis.text=element_blank(),
                axis.title=element_blank()) 
        
        
        plt <- plt + annotate(
          "text", label = paste0(round(dat[1,1], 0),"%"),
          x = -0.65, y = 22, size = 25, colour = "black"
        ) + theme(legend.position="none") + guides(fill="none") + theme_void() + ggtitle("OVERALL CX ASSESSMENT SCORE") + theme(plot.title = element_text(size = 20, face = "bold")) 
        
        
        yy <- c('yy', 'yy')
        
        score1 <- c(score1, (100-score1))
        score1 <- data.frame(score1, yy)
        score1$fill <- c("#ccccff", 'NA')
        
        p1<-ggplot(score1, aes(x=yy, y=score1)) + geom_bar(position = "stack", stat = 'identity', color="black", fill = score1$fill) + theme_minimal() + ggtitle("CLIENT-DRIVEN PLANNING") + ylim(c(0,100)) + 
          theme(plot.title = element_text(size = 14, face = "bold")) + theme(axis.text=element_text(size=14, color = "black")) + 
          theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())+ ylab("")#+ scale_y_continuous(labels = scales::percent_format(/100))
        
        p1 <- p1 + coord_flip() + annotate(
          "text", label = paste0(score1[1,1],"%"),
          x = 1, y = 35, size = 16, colour = "black"
        )
        
        #####   2
        
        score2 <- c(score2, (100-score2))
        score2 <- data.frame(score2, yy)
        score2$fill <- c("light pink", 'NA')
        
        p2<-ggplot(score2, aes(x=yy, y=score2)) + geom_bar(position = "stack", stat = 'identity', color="black", fill = score2$fill) + theme_minimal() + ggtitle("DESIGNING PROGRAMS AND SERVICES") + ylim(c(0,100)) + 
          theme(plot.title = element_text(size = 14, face = "bold")) + theme(axis.text=element_text(size=14, color = "black")) + 
          theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())+ ylab("")#+ scale_y_continuous(labels = scales::percent_format(/100))
        
        p2 <- p2 + coord_flip() + annotate(
          "text", label = paste0(score2[1,1],"%"),
          x = 1, y = 35, size = 16, colour = "black"
        )
        
        #####   3
        
        score3 <- c(score3, (100-score3))
        score3 <- data.frame(score3, yy)
        score3$fill <- c("orange", 'NA')
        
        p3<-ggplot(score3, aes(x=yy, y=score3)) + geom_bar(position = "stack", stat = 'identity', color="black", fill = score3$fill) + theme_minimal() + ggtitle("MEASURING CX OUTCOMES") + ylim(c(0,100)) + 
          theme(plot.title = element_text(size = 14, face = "bold")) + theme(axis.text=element_text(size=14, color = "black")) + 
          theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())+ ylab("")#+ scale_y_continuous(labels = scales::percent_format(/100))
        
        p3 <- p3 + coord_flip() + annotate(
          "text", label = paste0(score3[1,1],"%"),
          x = 1, y = 35, size = 16, colour = "black"
        )
        
        
        ##########  plt 4
        
        score4 <- c(score4, (100-score4))
        score4 <- data.frame(score4, yy)
        score4$fill <- c("light blue", 'NA')
        
        p4<-ggplot(score4, aes(x=yy, y=score4)) + geom_bar(position = "stack", stat = 'identity', color="black", fill = score4$fill) + theme_minimal() + ggtitle("WORKING IN A CLIENT-CENTRIC WAY") + ylim(c(0,100)) + 
          theme(plot.title = element_text(size = 14, face = "bold")) + theme(axis.text=element_text(size=14, color = "black")) + 
          theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())+ ylab("")#+ scale_y_continuous(labels = scales::percent_format(/100))
        
        p4 <- p4 + coord_flip() + annotate(
          "text", label = paste0(score4[1,1],"%"),
          x = 1, y = 35, size = 16, colour = "black"
        )
        
        lay <- rbind(c(1,1,1,2,2),
                     c(1,1,1,3,3),
                     c(1,1,1,4,4),
                     c(1,1,1,5,5))
        
        #library(grid)
        grid.arrange(plt, p1,p2,p3,p4, layout_matrix = lay)
        
      })
    })
    
    ############################################################### FRENCH TOTAL OUTPUT PLOT  ########################################################################################
    
    #observeEvent(input$submit_f,{
      # output$sum <- renderPrint({
      #   sum(c(as.numeric(input$results), as.numeric(input$results1)))
      # })})
    
    observeEvent(input$submit_f,{
      output$total_f = renderPlot({
        y <- sapply(x_f$`For your initiative, did you...`, function(i) input[[i]])
        y2 <- as.numeric(gsub("([0-9]+).*$", "\\1", y))
        y2 <- y2-1
        y2[is.na(y2)]<- 0
        
        score1 <- round((sum(y2)/5)*100, 0)
        
        v <- sapply(x2_f$`For your initiative, did you...`, function(i) input[[i]])
        v2 <- as.numeric(gsub("([0-9]+).*$", "\\1", v))
        v2 <- v2-1
        v2[is.na(v2)]<- 0
        score2 <- round((sum(v2)/5)*100, 0)
        
        vt3 <- sapply(x3_f$`For your initiative, did you...`, function(i) input[[i]])
        vt3 <- as.numeric(gsub("([0-9]+).*$", "\\1", vt3))
        vt3 <- vt3-1
        vt3[is.na(vt3)]<- 0
        score3 <- round((sum(vt3)/3)*100, 0)
        
        vt4 <- sapply(x4_f$`For your initiative, did you...`, function(i) input[[i]])
        vt4 <- as.numeric(gsub("([0-9]+).*$", "\\1", vt4))
        vt4 <- vt4-1
        vt4[is.na(vt4)]<- 0
        score4 <- round((sum(vt4)/4)*100, 0)  
        
        total <- mean(c(score1, score2, score3,score4))
        
        score <- c(total, 100-total)
        ot <- c("s", "f")
        fill1 <- c("red", "NA")
        
        dat <- data.frame(score, ot, fill1)
        
        
        number <- paste0(round(dat[1,1], 0), "%.")
        
        
        sentence <- paste0("Your initiative scored an overall ", number)
        
        plt <- ggplot(dat, aes(x = 1, y = score, fill = fill1)) + geom_bar(width = 1, stat = "identity", col = 1) + scale_fill_manual(values = c("gray94", 'light green'))+ 
          coord_polar(theta = "y") + xlim(-0.7, 1.5) #+
        labs(x = NULL, y = NULL) + 
          theme(axis.ticks=element_blank(),
                axis.text=element_blank(),
                axis.title=element_blank()) 
        
        
        plt <- plt + annotate(
          "text", label = paste0(round(dat[1,1], 0),"%"),
          x = -0.65, y = 22, size = 25, colour = "black"
        ) + theme(legend.position="none") + guides(fill="none") + theme_void() + ggtitle("VOTRE INITIATIVE A OBTENU \u000AUN R\u00C9SULTAT GLOBAL DE") + theme(plot.title = element_text(size = 20, face = "bold", hjust = 0.3)) 
        
        
        yy <- c('yy', 'yy')
        
        score1 <- c(score1, (100-score1))
        score1 <- data.frame(score1, yy)
        score1$fill <- c("#ccccff", 'NA')
        
  
        
        p1<-ggplot(score1, aes(x=yy, y=score1)) + geom_bar(position = "stack", stat = 'identity', color="black", fill = score1$fill) + theme_minimal() + ggtitle(HTML(paste("LA PLANIFICATION AX\u00C9E \u000ASUR LE CLIENT"))) + ylim(c(0,100)) + 
          theme(plot.title = element_text(size = 14, face = "bold")) + theme(axis.text=element_text(size=14, color = "black")) + 
          theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())+ ylab("")#+ scale_y_continuous(labels = scales::percent_format(/100))
        
        p1 <- p1 + coord_flip() + annotate(
          "text", label = paste0(score1[1,1],"%"),
          x = 1, y = 35, size = 16, colour = "black"
        )
        
        #####   2
        
        score2 <- c(score2, (100-score2))
        score2 <- data.frame(score2, yy)
        score2$fill <- c("light pink", 'NA')
        
        p2<-ggplot(score2, aes(x=yy, y=score2)) + geom_bar(position = "stack", stat = 'identity', color="black", fill = score2$fill) + theme_minimal() + ggtitle("LA CONCEPTION DE PROGRAMMES \u000AET DE SERVICES") + ylim(c(0,100)) + 
          theme(plot.title = element_text(size = 14, face = "bold")) + theme(axis.text=element_text(size=14, color = "black")) + 
          theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())+ ylab("")#+ scale_y_continuous(labels = scales::percent_format(/100))
        
        p2 <- p2 + coord_flip() + annotate(
          "text", label = paste0(score2[1,1],"%"),
          x = 1, y = 35, size = 16, colour = "black"
        )
        
        #####   3
        
        score3 <- c(score3, (100-score3))
        score3 <- data.frame(score3, yy)
        score3$fill <- c("orange", 'NA')
        
        p3<-ggplot(score3, aes(x=yy, y=score3)) + geom_bar(position = "stack", stat = 'identity', color="black", fill = score3$fill) + theme_minimal() + ggtitle("LA MESURE DES R\u00C9SULTATS \u000AEN MATI\u00C8RE D'EC ") + ylim(c(0,100)) + 
          theme(plot.title = element_text(size = 14, face = "bold")) + theme(axis.text=element_text(size=14, color = "black")) + 
          theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())+ ylab("")#+ scale_y_continuous(labels = scales::percent_format(/100))
        
        p3 <- p3 + coord_flip() + annotate(
          "text", label = paste0(score3[1,1],"%"),
          x = 1, y = 35, size = 16, colour = "black"
        )
        
        
        ##########  plt 4
        
        score4 <- c(score4, (100-score4))
        score4 <- data.frame(score4, yy)
        score4$fill <- c("light blue", 'NA')
        
        p4<-ggplot(score4, aes(x=yy, y=score4)) + geom_bar(position = "stack", stat = 'identity', color="black", fill = score4$fill) + theme_minimal() + ggtitle("LE TRAVAIL SELON L'APPROCHE \u000AAX\u00C9E SUR LA CLIENT\u00C8LE") + ylim(c(0,100)) + 
          theme(plot.title = element_text(size = 14, face = "bold")) + theme(axis.text=element_text(size=14, color = "black")) + 
          theme(axis.title.y=element_blank(), axis.text.y=element_blank(), axis.ticks.y=element_blank())+ ylab("")#+ scale_y_continuous(labels = scales::percent_format(/100))
        
        p4 <- p4 + coord_flip() + annotate(
          "text", label = paste0(score4[1,1],"%"),
          x = 1, y = 35, size = 16, colour = "black"
        )
        
        lay <- rbind(c(1,1,1,2,2),
                     c(1,1,1,3,3),
                     c(1,1,1,4,4),
                     c(1,1,1,5,5))
        
        #library(grid)
        grid.arrange(plt, p1,p2,p3,p4, layout_matrix = lay)
        
      })
    })
    
    
    
    
    
    
    
    
    observeEvent(input$submit,{
      output$warning2 <- renderUI({
        y <- sapply(x$`For your initiative, did you...`, function(i) input[[i]])
        
        y2 <- as.numeric(gsub("([0-9]+).*$", "\\1", y))
        y2 <- y2-1
        y2[is.na(y2)]<- 0
        
        score <- round((sum(y2)/5)*100, 0)
        warning = "For guidance on client-driven planning, please consult the following: IDEO Design Kit - The Field Guide to Human-Centered Design." 
        
        
        if (score != 100) {
          
          div(HTML("<p><b>Client-driven planning</b><li><a href='https://esdc.prv/en/service-canada/csb/client-experience-survey.shtml'> ESDC CX Survey results</a></li><li><a href='https://esdc.prv/en/service-canada/csb/sd/cfce.shtml'>Client Feedback Centre of Expertise</a></li></p>"))
          
        } else{
          
          invisible('')
          
        }
        
        
      }
      )
    })
    
    
    
    ############################### first text output #########################################
    
    observeEvent(input$submit,{
      output$text1 = renderUI({
        y <- sapply(x$`For your initiative, did you...`, function(i) input[[i]])
        y2 <- as.numeric(gsub("([0-9]+).*$", "\\1", y))
        y2 <- y2-1
        y2[is.na(y2)]<- 0
        
        score1 <- round((sum(y2)/5)*100, 0)
        
        v <- sapply(x2$`For your initiative, did you...`, function(i) input[[i]])
        v2 <- as.numeric(gsub("([0-9]+).*$", "\\1", v))
        v2 <- v2-1
        v2[is.na(v2)]<- 0
        score2 <- round((sum(v2)/5)*100, 0)
        
        vt3 <- sapply(x3$`For your initiative, did you...`, function(i) input[[i]])
        vt3 <- as.numeric(gsub("([0-9]+).*$", "\\1", vt3))
        vt3 <- vt3-1
        vt3[is.na(vt3)]<- 0
        score3 <- round((sum(vt3)/3)*100, 0)
        
        vt4 <- sapply(x4$`For your initiative, did you...`, function(i) input[[i]])
        vt4 <- as.numeric(gsub("([0-9]+).*$", "\\1", vt4))
        vt4 <- vt4-1
        vt4[is.na(vt4)]<- 0
        score4 <- round((sum(vt4)/4)*100, 0)  
        
        total <- mean(c(score1, score2, score3,score4))
        
        total <- round(total, 0)
        s <- paste0(total, "%.")
        
        
        
        
        cbox <- input$cbox_3
        #cbox <- paste(italic(cbox))
        #cbox <- HTML()
        cbox <- as.character(cbox)
        #cbox <- tags$em(cbox)
        # div(HTML("<p><b>Working in a client-centric way</b><li><a href='http://esdc.prv/en/department/service-strategy/solutions/ccp/index.shtml'> ESDC Client Centric Policy Playbook 1.0</a></li></p>"))

        #t1 <- div(HTML(paste("<b>","Your initiative - ","</b>","<em>", cbox, "</em>", "<b>", " - scored an overall ", s, "</b>")))
        
        t1 <- div(HTML(as.character(paste("<p>","<b>","Your initiative - ","</b>","<em>", cbox, "</em>", "<b>", " - scored an overall ", s, "</b>","</p>"))))
        
        #t1 <- "Your initiative scored an overall "
        #t1 <- paste0(t1, s)
       # t1 <- "average string"
        t1
        
      })
    })
    
    ###########################################    FRENCH first text output
    observeEvent(input$submit_f,{
      output$text1_f = renderUI({
        y <- sapply(x_f$`For your initiative, did you...`, function(i) input[[i]])
        y2 <- as.numeric(gsub("([0-9]+).*$", "\\1", y))
        y2 <- y2-1
        y2[is.na(y2)]<- 0
        
        score1 <- round((sum(y2)/5)*100, 0)
        
        v <- sapply(x2_f$`For your initiative, did you...`, function(i) input[[i]])
        v2 <- as.numeric(gsub("([0-9]+).*$", "\\1", v))
        v2 <- v2-1
        v2[is.na(v2)]<- 0
        score2 <- round((sum(v2)/5)*100, 0)
        
        vt3 <- sapply(x3_f$`For your initiative, did you...`, function(i) input[[i]])
        vt3 <- as.numeric(gsub("([0-9]+).*$", "\\1", vt3))
        vt3 <- vt3-1
        vt3[is.na(vt3)]<- 0
        score3 <- round((sum(vt3)/3)*100, 0)
        
        vt4 <- sapply(x4_f$`For your initiative, did you...`, function(i) input[[i]])
        vt4 <- as.numeric(gsub("([0-9]+).*$", "\\1", vt4))
        vt4 <- vt4-1
        vt4[is.na(vt4)]<- 0
        score4 <- round((sum(vt4)/4)*100, 0)  
        
        total <- mean(c(score1, score2, score3,score4))
        
        total <- round(total, 0)
        s <- paste0(total, "%.")
        
        
        
        
        cbox <- input$cbox_3
        #cbox <- paste(italic(cbox))
        #cbox <- HTML()
        cbox <- as.character(cbox)
        t1 <- HTML(paste("<b>","Votre initiative - ","</b>","<em>", cbox, "</em>", "<b>", " - a obtenu un score global de", s, "</b>"))
        
        #t1 <- "Your initiative scored an overall "
        #t1 <- paste0(t1, s)
        t1
        
      })
    })
    
    
    
    #################################  2nd text output ##########################
    
    
    
    
    observeEvent(input$submit,{
      output$text2 = renderText({
        y <- sapply(x$`For your initiative, did you...`, function(i) input[[i]])
        y2 <- as.numeric(gsub("([0-9]+).*$", "\\1", y))
        y2 <- y2-1
        y2[is.na(y2)]<- 0
        
        score1 <- round((sum(y2)/5)*100, 0)
        
        v <- sapply(x2$`For your initiative, did you...`, function(i) input[[i]])
        v2 <- as.numeric(gsub("([0-9]+).*$", "\\1", v))
        v2 <- v2-1
        v2[is.na(v2)]<- 0
        score2 <- round((sum(v2)/5)*100, 0)
        
        vt3 <- sapply(x3$`For your initiative, did you...`, function(i) input[[i]])
        vt3 <- as.numeric(gsub("([0-9]+).*$", "\\1", vt3))
        vt3 <- vt3-1
        vt3[is.na(vt3)]<- 0
        score3 <- round((sum(vt3)/3)*100, 0)
        
        vt4 <- sapply(x4$`For your initiative, did you...`, function(i) input[[i]])
        vt4 <- as.numeric(gsub("([0-9]+).*$", "\\1", vt4))
        vt4 <- vt4-1
        vt4[is.na(vt4)]<- 0
        score4 <- round((sum(vt4)/4)*100, 0)  
        
        total <- sum(score1+ score2 + score3 +score4)/4
        
        total <- round(total, 0)
        
        s <- paste0(total, "%.")
        
        t1 <- "Thank you for completing the CX Assessment. Your CX initiative scored an overall "
        
        t1 <- paste0(t1, s)
        
        t2 <- "Your score indicates an opportunity to improve the use of CX practices for your current initiative. Please consult the following resources to help guide improvements in the following areas:"
        
        t3 <- "The CX Centre of Expertise is of the opinion that your initiative is following best CX practices. Below you will find links to the CXSpace and other additional resources."
        
        t2 <- ifelse(total != 100, t2, t3) 
        
        t2
        
      })
    })
    
    
    #####################################  FRENCH TEXT2 #############################################################################
    
    observeEvent(input$submit_f,{
      output$text2_f = renderText({
        y <- sapply(x_f$`For your initiative, did you...`, function(i) input[[i]])
        y2 <- as.numeric(gsub("([0-9]+).*$", "\\1", y))
        y2 <- y2-1
        y2[is.na(y2)]<- 0
        
        score1 <- round((sum(y2)/5)*100, 0)
        
        v <- sapply(x2_f$`For your initiative, did you...`, function(i) input[[i]])
        v2 <- as.numeric(gsub("([0-9]+).*$", "\\1", v))
        v2 <- v2-1
        v2[is.na(v2)]<- 0
        score2 <- round((sum(v2)/5)*100, 0)
        
        vt3 <- sapply(x3_f$`For your initiative, did you...`, function(i) input[[i]])
        vt3 <- as.numeric(gsub("([0-9]+).*$", "\\1", vt3))
        vt3 <- vt3-1
        vt3[is.na(vt3)]<- 0
        score3 <- round((sum(vt3)/3)*100, 0)
        
        vt4 <- sapply(x4_f$`For your initiative, did you...`, function(i) input[[i]])
        vt4 <- as.numeric(gsub("([0-9]+).*$", "\\1", vt4))
        vt4 <- vt4-1
        vt4[is.na(vt4)]<- 0
        score4 <- round((sum(vt4)/4)*100, 0)  
        
        total <- sum(score1+ score2 + score3 +score4)/4
        
        total <- round(total, 0)
        
        s <- paste0(total, "%.")
        
        t1 <- "Thank you for completing the CX Assessment. Your CX initiative scored an overall "
        
        t1 <- paste0(t1, s)
        
        t2 <- HTML(paste("Votre score indique une possibilit&#233; d'am&#233;liorer l'utilisation des pratiques en mati&#232;re d'EC pour votre initiative. Veuillez consulter les ressources suivantes pour vous aider &#224; orienter les am&#233;liorations dans les domaines suivants &#58;"))
        
        t3 <- HTML(paste("Le Centre d'expertise de l'exp&#233;rience client est d'avis que votre initiative suit les meilleures pratiques CX. Vous trouverez ci-dessous des liens vers le CXSpace et d'autres ressources suppl&#233;mentaires."))
        
        t2 <- ifelse(total != 100, t2, t3) 
        
        t2
        
      })
    })
    
    
    
    
    observeEvent(input$submit,{
      output$resources = renderText({
        y <- sapply(x$`For your initiative, did you...`, function(i) input[[i]])
        y2 <- as.numeric(gsub("([0-9]+).*$", "\\1", y))
        y2 <- y2-1
        y2[is.na(y2)]<- 0
        
        score1 <- round((sum(y2)/5)*100, 0)
        
        v <- sapply(x2$`For your initiative, did you...`, function(i) input[[i]])
        v2 <- as.numeric(gsub("([0-9]+).*$", "\\1", v))
        v2 <- v2-1
        v2[is.na(v2)]<- 0
        score2 <- round((sum(v2)/5)*100, 0)
        
        vt3 <- sapply(x3$`For your initiative, did you...`, function(i) input[[i]])
        vt3 <- as.numeric(gsub("([0-9]+).*$", "\\1", vt3))
        vt3 <- vt3-1
        vt3[is.na(vt3)]<- 0
        score3 <- round((sum(vt3)/3)*100, 0)
        
        vt4 <- sapply(x4$`For your initiative, did you...`, function(i) input[[i]])
        vt4 <- as.numeric(gsub("([0-9]+).*$", "\\1", vt4))
        vt4 <- vt4-1
        vt4[is.na(vt4)]<- 0
        score4 <- round((sum(vt4)/4)*100, 0)  
        
        total <- sum(c(score1, score2 , score3 ,score4))/4
        
        total <- round(total, 0)
        
        s <- paste0(total, "%.")
        
        
        t2 <- "We recommend you consult the following resource(s) to help guide improvements in the following areas: "
        
        t3 <- invisible('')
        
        t2 <- ifelse(total != 100, t2, t3) 
        
        t2
        
      })
    })
    
    
    
    
    
    
    
    total <- round(100, 0)
    
    s <- paste0(total, "%.")
    
    t1 <- "Thank you for completing the CX Assessment. Your CX initiative scored an overall "
    
    t1 <- paste0(t1, s)
    
    t2 <- "This score indicates that there are steps to improving your CX initiative. Please continue below to see where you can improve and for resources. You can download this report at the bottom of the page."
    
    t3 <- "Please continue below to see your evaluation. You can download this report at the bottom."
    
    t2 <- ifelse(total != 100, t2, t3) 
    
    t2
    
    
    ######################### TABLE 1 ###################################
    Lead_f <- c(
      HTML(paste("Renseignements cl&eacute;s")), 
      HTML(paste("Direction g&eacute;n&eacute;rale et direction responsables")),
                 "Nom de l'initiative",
      HTML(paste("But et objectifs cl&eacute;s")),
      HTML(paste("Client	&egrave;le cible g&eacute;n&eacute;rale")),
      HTML(paste("&Eacute;ch&eacute;anciers")))
    
    
    Lead2 <- c("Key information", "Lead Branch and Directorate", "Name of the initiative", "Purpose and key objective(s)", "Target client group", "Timelines")
    #tofill <- c(1:6)
    Lead <- c("Key information", "Lead Branch and Directorate", "Name of the initiative", "Purpose and key objective(s)", "Target client group", "Timelines")
    
    
    Tbl1 <- data.table(Lead = Lead, tofill = rep("", 5)) 
    
    output$tbl1 = renderDataTable(
      Tbl1, escape = FALSE, selection = 'none', server = FALSE, rownames=FALSE,
      options = list(dom = 't', paging = FALSE, ordering = FALSE, autoWidth = FALSE,
                     columnDefs = list(list(Width = "130px", targets = 1))),
      callback = JS("table.rows().every(function(i, tab, row) {
                    var $this = $(this.node());
                    $this.attr('id', this.data()[0]);
                    $this.addClass('shiny-input-radiogroup');
  });
                    Shiny.unbindAll(table.table().node());
                    Shiny.bindAll(table.table().node());")
    )
    
    
    
    valuest <- reactiveValues()
    
    
    valuest$datat <- as.data.frame(Lead)

    shinyInput = function(FUN, len, id, ...) {
      #validate(need(character(len)>0,message=paste("")))
      inputs = character(len)
      for (i in seq_len(len)) {
        inputs[i] = as.character(FUN(paste0(id, i), label = "cbox_eng_1", ...))
      }
      inputs
    }
    
    
    output$ruless <- DT::renderDataTable({
      
                    jsc2 <- '
              function(settings, json) {
                $("#ruless td:contains(\'Key information\')").attr("colspan", "2").css("text-align", "left").css("background-color", "#248c84").css("color","white").css("font-family", "Arial").css("font-weight", "bold").css("line-height", "2.5").css("text-size", "18").css("text-indent", "10px");
               
                $("#ruless tbody > tr:nth-child(1) > td:nth-child(2)").remove();
                $("#ruless thead").remove();
                $("#ruless tbody > tr:nth-child(2) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                  $("#ruless tbody > tr:nth-child(3) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                    $("#ruless tbody > tr:nth-child(4) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                          $("#ruless tbody > tr:nth-child(5) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
              
                  $("#ruless tbody > tr:nth-child(6) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                  $("#ruless tbody > tr:nth-child(7) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                    $("#ruless tbody > tr:nth-child(8) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                      $("#ruless tbody > tr:nth-child(9) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                      $("#ruless tbody > tr:nth-child(9)").css("height", "25px").css("padding", "5px");
                      $("#ruless tr:nth-child(5)").css("text-size", "16px");
                      $("#ruless td").css("border","1px solid black");
              }'
                    
                    #tags$head(tags$style(type="text/css", "#textInput {width: 800px}"))
      
     
      
      dft <-  data.frame(valuest$datat,(Lead=shinyInput(textInput,nrow(valuest$datat),"cbox_", width ='400px')))     
      xrul <- datatable(dft,
                     #container = myContainer,
                     selection="none",
                     rownames = F,
                     class = "display nowrap compact",
                     escape = FALSE,
                     filter = "none",
                     colnames = c("Lead", "ti"),
                     #extensions = list("ColReorder" = NULL, "Buttons" = NULL),
                     options = list(
                       dom = 't', ordering = F,
                       autoWidth=F,
                       ColReorder = FALSE,
                       #columnDefs = list(list(width = '200px', targets = 1)),
                       preDrawCallback = JS('function() { Shiny.unbindAll(this.api().table().node()); }'),
                       drawCallback = JS('function() { Shiny.bindAll(this.api().table().node()); } '),
                       initComplete = JS(jsc2)
                     )) %>% formatStyle('Lead', lineHeight="20%", target= "row")
    }) 
    
    
    #####################################################   FRENCH     fillable table new initiative   ##############################
    
    Tbl1_f <- data.table(Lead_f = Lead_f, tofill = rep("", 5)) 
    
    output$tbl1_f = renderDataTable(
      Tbl1_f, escape = FALSE, selection = 'none', server = FALSE, rownames=FALSE,
      options = list(dom = 't', paging = FALSE, ordering = FALSE, autoWidth = FALSE,
                     columnDefs = list(list(Width = "130px", targets = 1))),
      callback = JS("table.rows().every(function(i, tab, row) {
                    var $this = $(this.node());
                    $this.attr('id', this.data()[0]);
                    $this.addClass('shiny-input-radiogroup');
  });
                    Shiny.unbindAll(table.table().node());
                    Shiny.bindAll(table.table().node());")
    )
    
    
    
    valuest_f <- reactiveValues()
    
    
    valuest_f$datat_f <- as.data.frame(Lead_f)
    
    shinyInput = function(FUN, len, id, ...) {
      #validate(need(character(len)>0,message=paste("")))
      inputs = character(len)
      for (i in seq_len(len)) {
        inputs[i] = as.character(FUN(paste0(id, i), label = NULL, ...))
      }
      inputs
    }
    
# $("#ruless td:contains(\'Key information\')").attr("colspan", "2").css("text-align", "left").css("background-color", "#248c84").css("color","white").css("font-family", "Arial").css("font-weight", "bold").css("line-height", "2.5").css("text-size", "18").css("text-indent", "10px");
  
    output$ruless_f <- DT::renderDataTable({
      
      jsc2_f <- '
              function(settings, json) {
                $("#ruless_f td:contains(Renseignements)").attr("colspan", "2").css("text-align", "left").css("background-color", "#248c84").css("color","white").css("font-family", "Arial").css("font-weight", "bold").css("line-height", "2.5").css("text-size", "18").css("text-indent", "10px");
                $("#ruless_f tbody > tr:nth-child(1) > td:nth-child(2)").remove();
                $("#ruless_f thead").remove();
                $("#ruless_f tbody > tr:nth-child(2) > td:nth-child(1)").css("text-indent", "5px").css("color", "black").css("vertical-align", "middle");
                  $("#ruless_f tbody > tr:nth-child(3) > td:nth-child(1)").css("text-indent", "5px").css("color", "black").css("vertical-align", "middle");
                    $("#ruless_f tbody > tr:nth-child(4) > td:nth-child(1)").css("text-indent", "5px").css("color", "black").css("vertical-align", "middle");
                          $("#ruless_f tbody > tr:nth-child(5) > td:nth-child(1)").css("text-indent", "5px").css("color", "black").css("vertical-align", "middle");
              
                  $("#ruless_f tbody > tr:nth-child(6) > td:nth-child(1)").css("text-indent", "5px").css("color", "black").css("vertical-align", "middle");
                  $("#ruless_f tbody > tr:nth-child(7) > td:nth-child(1)").css("text-indent", "5px").css("color", "black").css("vertical-align", "middle");
                    $("#ruless_f tbody > tr:nth-child(8) > td:nth-child(1)").css("text-indent", "5px").css("color", "black").css("vertical-align", "middle");
                      $("#ruless_f tbody > tr:nth-child(9) > td:nth-child(1)").css("text-indent", "5px").css("color", "black").css("vertical-align", "middle");
                      $("#ruless_f tbody > tr:nth-child(9)").css("height", "25px").css("padding", "5px");
                      $("#ruless_f tr:nth-child(5)").css("text-size", "15px");
                      $("#ruless_f td").css("border","1px solid black");
              }'
      
      tags$head(tags$style(type="text/css", "#textInput {width: 100px}"))
      
      
      
      dft <-  data.frame(valuest_f$datat_f,(Lead_f=shinyInput(textInput,nrow(valuest_f$datat_f),"cbox_", width ='325px')))     
      xrul <- datatable(dft,
                        #container = myContainer,
                        selection="none",
                        rownames = F,
                        class = "display nowrap compact",
                        escape = FALSE,
                        filter = "none",
                        colnames = c("Lead_f", "ti"),
                        #extensions = list("ColReorder" = NULL, "Buttons" = NULL),
                        options = list(
                          dom = 't', ordering = F,
                          autoWidth=FALSE,
                          ColReorder = FALSE,
                          #columnDefs = list(list(width = '200px', targets = 1)),
                          preDrawCallback = JS('function() { Shiny.unbindAll(this.api().table().node()); }'),
                          drawCallback = JS('function() { Shiny.bindAll(this.api().table().node()); } '),
                          initComplete = JS(jsc2_f)
                        )) %>% formatStyle('Lead_f', lineHeight="20%", target= "row")
    }) 
    
    
    
    
    
    
    
    #####################################   ruless table for section 2
    
    values <- reactiveValues()
    
    
    values$data <- as.data.frame(Lead)
    
    output$ruless_section2 <- DT::renderDataTable({
      
                      jsc5 <- '
                function(settings, json) {
                  $("#ruless_section2 td:contains(\'Key information\')").attr("colspan", "2").css("text-align", "left").css("background-color", "#248c84").css("color","white").css("font-family", "Arial").css("font-weight", "bold").css("line-height", "2.5").css("text-size", "18").css("text-indent", "10px");
                  $("#ruless_section2 tbody > tr:nth-child(1) > td:nth-child(2)").remove();
                  $("#ruless_section2 thead").remove();
                  $("#ruless_section2 tbody > tr:nth-child(2) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                    $("#ruless_section2 tbody > tr:nth-child(3) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                      $("#ruless_section2 tbody > tr:nth-child(4) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                            $("#ruless_section2 tbody > tr:nth-child(5) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                
                    $("#ruless_section2 tbody > tr:nth-child(6) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                    $("#ruless_section2 tbody > tr:nth-child(7) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                      $("#ruless_section2 tbody > tr:nth-child(8) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                        $("#ruless_section2 tbody > tr:nth-child(9) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                        $("#ruless_section2 tbody > tr:nth-child(9)").css("height", "25px").css("padding", "5px");
                        $("#ruless_section2 tr:nth-child(5)").css("text-size", "16px");
                        $("#ruless_section2 td").css("border","1px solid black");
                }'
      
      #tags$head(tags$style(type="text/css", "#textInput {width: 800px}"))
      
      df <-  data.frame(values$data,(Lead=shinyInput(textInput,nrow(values$data),"cbox_", width ='400px')))     
      x <- datatable(df,
                     #container = myContainer,
                     selection="none",
                     rownames = F,
                     class = "display nowrap compact",
                     escape = FALSE,
                     filter = "none",
                     colnames = c("Lead", ""),
                     #extensions = list("ColReorder" = NULL, "Buttons" = NULL),
                     options = list(
                       dom = 't', ordering = F,
                       autoWidth=FALSE,
                       ColReorder = FALSE,
                       #columnDefs = list(list(width = '200px', targets = 1)),
                       preDrawCallback = JS('function() { Shiny.unbindAll(this.api().table().node()); }'),
                       drawCallback = JS('function() { Shiny.bindAll(this.api().table().node()); } '),
                       initComplete = JS(jsc5)
                     )) %>% formatStyle('Lead', lineHeight="20%", target= "row")
    }) 
    
    
    table_input2 <- eventReactive(input$submit,
                                  {input$cbox_3}
    )
    
    output$table_ti2 <- renderText(
      table_input2()
    )
    
    
    #########################  FRENCH   EXISTING INITIATIVE TEXT TABLE    ##########################################################################
    valuest_2f <- reactiveValues()
    
    
    valuest_2f$datat_2f <- as.data.frame(Lead_f)
    
    output$ruless_2f <- DT::renderDataTable({
      
      jsc2_2f <- '
              function(settings, json) {
                $("#ruless_2f td:contains(Renseignements)").attr("colspan", "2").css("text-align", "left").css("background-color", "#248c84").css("color","white").css("font-family", "Arial").css("font-weight", "bold").css("line-height", "2.5").css("text-size", "18").css("text-indent", "10px");
                $("#ruless_2f tbody > tr:nth-child(1) > td:nth-child(2)").remove();
                $("#ruless_2f thead").remove();
                $("#ruless_2f tbody > tr:nth-child(2) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                  $("#ruless_2f tbody > tr:nth-child(3) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                    $("#ruless_2f tbody > tr:nth-child(4) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                          $("#ruless_2f tbody > tr:nth-child(5) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
              
                  $("#ruless_2f tbody > tr:nth-child(6) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                  $("#ruless_2f tbody > tr:nth-child(7) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                    $("#ruless_2f tbody > tr:nth-child(8) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                      $("#ruless_2f tbody > tr:nth-child(9) > td:nth-child(1)").css("text-indent", "20px").css("color", "black").css("vertical-align", "middle");
                      $("#ruless_2f tbody > tr:nth-child(9)").css("height", "25px").css("padding", "5px");
                      $("#ruless_2f tr:nth-child(5)").css("text-size", "16px");
                      $("#ruless_2f td").css("border","1px solid black");
              }'
      
      tags$head(tags$style(type="text/css", "#textInput {width: 100px}"))
      
      
      
      dft <-  data.frame(valuest_2f$datat_2f,(Lead_f=shinyInput(textInput,nrow(valuest_2f$datat_2f),"cbox_", width ='325px')))     
      xrul <- datatable(dft,
                        #container = myContainer,
                        selection="none",
                        rownames = F,
                        class = "display nowrap compact",
                        escape = FALSE,
                        filter = "none",
                        colnames = c("Lead_f", "ti"),
                        #extensions = list("ColReorder" = NULL, "Buttons" = NULL),
                        options = list(
                          dom = 't', ordering = F,
                          autoWidth=FALSE,
                          ColReorder = FALSE,
                          #columnDefs = list(list(width = '200px', targets = 1)),
                          preDrawCallback = JS('function() { Shiny.unbindAll(this.api().table().node()); }'),
                          drawCallback = JS('function() { Shiny.bindAll(this.api().table().node()); } '),
                          initComplete = JS(jsc2_2f)
                        )) %>% formatStyle('Lead_f', lineHeight="20%", target= "row")
    }) 
    
    
    
    
    
    
####################################################################   new initiative table english  ###########################################################################
################################################################################################################################################################################
    
   
        
    row_a <- c("<p>A clear definition of the problem you are trying to solve for your <u href='#' aria-label='Target audience refers to the specific group of consumers most likely to want your product or service, and therefore, the group of people who should see your ad campaigns. Target audience may be dictated by age, gender, income, location, interests or a myriad of other factors.'>target audience</u>.</p>", 
               "Resources allocated to incorporate CX-related practices into the design and usability testing of your initiative's client experience.", "A clear understanding of what your target audience is expecting from your initiative.",
               "A high-level view of the steps clients will need to take to meet the eligibility criteria and fulfill program requirements.", "Client data to better understand your target audience's needs, preferences and behaviours, e.g., ESDC's CX survey results, client journey maps and other external sources.",
               "Insights on the way people prefer to access programs and services and how the following service barriers may impact your target audience:",
               "     <p>a) <u href='#'aria-label='Due to not promoting or communicating our services effectively.'>Awareness of eligibility</u></p>",
               "     <p>b) <u href='#'aria-label='Processes and approaches can discourage or prevent some clients from applying when we do not account for their social and cultural context or cultural context can impede some from interacting with government.'>Cultural awareness</u></p>",
               "     <p>c) <u href='#'aria-label='Overly complicated and time-consuming, making it difficult to understand and apply for a service.'>Service design</u></p>",
               "     <p>d) <u href='#'aria-label='Using language and information that requires a high level of competency for a client to understand. '>Literacy or numeracy</u></p>",
               "     <p>e) <u href='#'aria-label='Due to distance, hours of operation, inaccessible infrastructure or not having Internet access, clients who feel unsafe in an in-person setting as a result of the pandemic.'>Service availability (e.g. location)</u></p>",
               "     <p>f) <u href='#'aria-label='Includes foundational aspects of our programs (e.g., tax system-based), eligibility or entitlement criteria, deadlines, and/or costs which may be prohibitive to certain clients.'>Policy design</u></p>",
               "     <p>g) <u href='#'aria-label='Elements that hinder access to services by a person with a disability. E.g. Physical Space, Awareness & Attitude, Policies & Processes, Technology, Language & Information.'>Accessibility barrier</u></p>",
               "     <p>h) <u href='#'aria-label='Not communicating in the client&#39s language, including official language, Indigenous language, sign language (ASL or LSQ) or other language.'>Language of service</u></p>",
               "Input on your initiative from stakeholders in Policy, Program and Service, as well as the CX Centre of Expertise.",
               "The means to monitor, measure and identify pain points using CX-related Key Performance Indicators."
    )
    
    
    tbl_a <- data.table('Do you have...' = row_a, 'No' = rep(1,length(row_a)), 'Yes' = rep(2,length(row_a)), 
                        checked=c(rep("No",0),rep("Yes",0)))
    
    
    
    tbl_a [, `No` := sprintf( '<input type="radio" name="%s" value="%s" %s/>', `Do you have...`, tbl_a [, `No`],ifelse("No"==tbl_a[, checked],"" ,""))]
    tbl_a [, `Yes` := sprintf( '<input type="radio" name="%s" value="%s" %s/>', `Do you have...`, tbl_a [, `Yes`],ifelse("Yes"==tbl_a[, checked],"unchecked" ,"" ))]
    
    
    
    output$tbl_a = DT::renderDataTable(
      tbl_a[,-c("checked")], escape = FALSE, selection = 'none', server = FALSE, rownames=FALSE, colnames = c("For your new initiative, do you have...", "No", "Yes"), #caption = "This checklist provides key CX-related practices to consider as part of your initial planning. Once completed, you can use it as discussion points to inform staff, colleagues or senior management on how to become client-centric.",
      options = list(dom = 't', paging = FALSE, ordering = FALSE,  autoWidth = FALSE, 
                     columnDefs = list(list(Width = "130px", targets = 1)),
                     initComplete = JS(
                       "function(settings, json) {",
                       "$('td').css({'border': '1px solid black'});",
                       "$('th').css({'border': '1px solid black'}).css({'font-size': '18px'});",
                       "$('td:nth-child(2)').css({'width': '100px'});",
                       "$('th').css({'line-height': '40px'});",
                       "$('#tbl_a tr:nth-child(6) td:first-child').attr({'colspan': '3'}).css({'padding-right':'200px'}).css({'padding-top': '18px'}).css({'padding-bottom': '18px'}).css({'border-top-width': 'medium'});",
                       "$('#tbl_a tr:nth-child(6) td:nth-child(2)').remove();",
                       "$('#tbl_a tr:nth-child(6) td:nth-child(3)').remove();",
                       "$('#tbl_a tbody > tr:nth-child(6) > td:nth-child(2)').remove();",
                       
                       
                       "$('#tbl_a th:first-child').css({'background-color': '#248c84'}).css({'color': 'white'});",
                       "$('#tbl_a th:nth-child(2)').css({'background-color': '#FFB6C1'}).css({'color': 'black'});",
                       "$('#tbl_a th:nth-child(3)').css({'background-color': '#ace1af'}).css({'color': 'black'});",
                       "$('th:first-child').css({'text-indent': '-5px'});",
                       "$('tr:nth-child(1)').css({'color': 'black'});",
                       "$('tr:nth-child(2)').css({'color': 'black'});",
                       "$('tr:nth-child(3)').css({'color': 'black'});",
                       "$('tr:nth-child(4)').css({'color': 'black'});",
                       "$('tr:nth-child(5)').css({'color': 'black'});",
                       "$('#tbl_a tr:nth-child(12) td:first-child').css({'text-indent': '30px'});",
                       "$('tr:nth-child(13) td:first-child').css({'text-indent': '30px'});",
                       "$('tr:nth-child(7) td:first-child').css({'text-indent': '30px'});",
                       "$('tr:nth-child(8) td:first-child').css({'text-indent': '30px'});",
                       "$('tr:nth-child(9) td:first-child').css({'text-indent': '30px'});",
                       "$('tr:nth-child(10) td:first-child').css({'text-indent': '30px'});",
                       "$('tr:nth-child(11) td:first-child').css({'text-indent': '30px'});",
                       "$('tr:nth-child(14) td:first-child').css({'text-indent': '30px'});",
                       "$('tr:nth-child(15) td').css({'border-top-width': 'medium'});",
                       "}")),
      
      callback = JS("table.rows().every(function(i, tab, row) {
                    var $this = $(this.node());
                    $this.attr('id', this.data()[0]);
                    $this.addClass('shiny-input-radiogroup');
  });
                    Shiny.unbindAll(table.table().node());
                    Shiny.bindAll(table.table().node());"),
    )
    
    ###############################################  NEW INITIATIVE TABLE FRENCH   #########################################################################################
    
    row_a_f <- c(HTML(paste("<p>Une d&eacute;finition claire du probl&egrave;me que vous essayez de r&eacute;soudre pour votre  <u href='#' aria-label='Le public cible d&#233;signe le groupe sp&#233;cifique de consommateurs les plus susceptibles de vouloir votre produit ou service, et donc le groupe de personnes qui devraient voir vos campagnes publicitaires. Le public cible peut d&#233;pendre de l&#39&#226;ge, du sexe, du revenu, de la localisation, les int&#233;r&#234;ts et de nombreux autres facteurs.'>client&egrave;le cible</u>.</p>")), 
               HTML(paste("Les ressources allou&eacute;es pour int&eacute;grer les pratiques en mati&egrave;re d'EC &agrave; la conception et les tests de convivialit&eacute; de l&#39exp&eacute;rience client de votre initiative.")), 
               HTML(paste("Une compr&eacute;hension claire de ce que votre client&egrave;le cible attend de votre initiative")),
               HTML(paste("Un aper&ccedil;u g&eacute;n&eacute;ral des &eacute;tapes que les clients devront suivre pour satisfaire aux crit&egrave;res d&#39admissibilit&eacute; et aux exigences du programme.")),
               HTML(paste("Des donn&eacute;es sur les clients pour mieux comprendre les besoins, les pr&eacute;f&eacute;rences et les comportements de votre public cible, p. ex. les r&eacute;sultats du sondage sur l&#39exp&eacute;rience client men&eacute; par EDSC, les cartes du parcours des clients et d'autres sources externes.")),
               HTML(paste("Un aper&ccedil;u de l&#39incidence que les obstacles suivants peuvent avoir sur votre public cible &#58; ")),
               HTML(paste("     <p>a) <u href='#'aria-label='En raison d&#39une absence de promotion ou d&#39une communication inefficace de nos services.'>Connaissance des crit&egrave;res d&#39admissibilit&eacute;</u></p>")),
               HTML(paste("     <p>b) <u href='#'aria-label='Les processus et les approches peuvent d&#233;courager ou emp&#234;cher certains clients de faire une demande si nous ne tenons pas compte de leur contexte social et culturel ou si le contexte culturel peut emp&#234;cher certains d&#39interagir avec le gouvernement.'>Conscience culturelle</u></p>")),
               HTML(paste("     <p>c) <u href='#'aria-label='Trop compliqu&#233; et chronophage, ce qui rend difficiles la compr&#233;hension et la pr&#233;sentation d&#39une demande pour obtenir un service.'>Conception de services</u></p>")),
               HTML(paste("     <p>d) <u href='#'aria-label='Utiliser un langage et des renseignements qui exigent du client un niveau de comp&#233;tence &#233;lev&#233;.'>Litt&eacute;ratie ou num&eacute;ratie</u></p>")),
               HTML(paste("     <p>e) <u href='#'aria-label='En raison de la distance, des heures d&#39ouverture, de l&#39inaccessibilit&#233; des infrastructures ou de l&#39absence d&#39acc&#232;s &#224; l&#39Internet, les clients qui ne se sentent pas en s&#233;curit&#233; dans une situation de prestation de services en personne en raison de la pand&#233;mie.'>Disponibilit&eacute; des services (p. ex. l&#39emplacement)</u></p>")),
               HTML(paste("     <p>f) <u href='#'aria-label='Comprend les aspects fondamentaux de nos programmes (par exemple, bas&#233;s sur le syst&#232;me fiscal), les crit&#232;res d&#39admissibilit&#233; ou de droit, les d&#233;lais et/ou les co&#251;ts qui peuvent &#234;tre co&#251;teux pour certains clients).'>Conception de politiques</u></p>")),
               HTML(paste("     <p>g) <u href='#'aria-label='Tout &#233;l&#233;ment qui emp&#234;che une personne handicap&#233;e d&#39acc&#233;der aux services. Par exemple, l&#39espace physique, la sensibilisation et l&#39attitude, les politiques et les processus, la technologie, la langue et l&#39information.'>Obstacle &agrave; l&#39accessibilit&eacute;</u></p>")),
               HTML(paste("     <p>h) <u href='#'aria-label='Ne pas communiquer dans la langue du client, y compris la langue officielle, la langue autochtone, la langue des signes (ASL ou LSQ) ou une autre langue.'>Langue de service</u></p>")),
               HTML(paste("Des avis sur votre initiative de la part des intervenants qui participent &agrave; l&#39&eacute;laboration des politiques, des programmes et des services, ainsi que du Centre d&#39expertise de l&#39EC.")),
               HTML(paste("Les moyens de surveiller, de mesurer et de rep&eacute;rer les &eacute;l&eacute;ments difficiles &agrave; l&#39aide des indicateurs de rendement cl&eacute;s relatifs &agrave; l&#39EC."))
    )
    
    
    tbl_a_f <- data.table('Do you have...' = row_a_f, 'No' = rep(1,length(row_a_f)), 'Yes' = rep(2,length(row_a_f)), 
                        checked=c(rep("No",0),rep("Yes",0)))
    
    
    
    tbl_a_f [, `No` := sprintf( '<input type="radio" name="%s" value="%s" %s/>', `Do you have...`, tbl_a_f [, `No`],ifelse("No"==tbl_a_f[, checked],"" ,""))]
    tbl_a_f [, `Yes` := sprintf( '<input type="radio" name="%s" value="%s" %s/>', `Do you have...`, tbl_a_f [, `Yes`],ifelse("Yes"==tbl_a_f[, checked],"unchecked" ,"" ))]
    
    
    
    output$tbl_a_f = DT::renderDataTable(
      tbl_a_f[,-c("checked")], escape = FALSE, selection = 'none', server = FALSE, rownames=FALSE, colnames = c("En ce qui concerne votre initiative, avez-vous...", "Non", "Oui"), #caption = "This checklist provides key CX-related practices to consider as part of your initial planning. Once completed, you can use it as discussion points to inform staff, colleagues or senior management on how to become client-centric.",
      options = list(dom = 't', paging = FALSE, ordering = FALSE,  autoWidth = FALSE, 
                     columnDefs = list(list(Width = "130px", targets = 1)),
                     initComplete = JS(
                       "function(settings, json) {",
                       "$('td').css({'border': '1px solid black'});",
                       "$('th').css({'border': '1px solid black'}).css({'font-size': '18px'});",
                       "$('td:nth-child(2)').css({'width': '100px'});",
                       "$('th').css({'line-height': '40px'});",
                       "$('#tbl_a_f tr:nth-child(6) td:first-child').attr({'colspan': '3'}).css({'padding-right':'200px'}).css({'padding-top': '18px'}).css({'padding-bottom': '18px'}).css({'border-top-width': 'medium'});",
                       "$('#tbl_a_f tr:nth-child(6) td:nth-child(2)').remove();",
                       "$('#tbl_a_f tr:nth-child(6) td:nth-child(3)').remove();",
                       "$('#tbl_a_f tbody > tr:nth-child(6) > td:nth-child(2)').remove();",
                       "$('#tbl_a_f th:first-child').css({'background-color': '#248c84'}).css({'color': 'white'});",
                       "$('#tbl_a_f th:nth-child(2)').css({'background-color': '#FFB6C1'}).css({'color': 'black'});",
                       "$('#tbl_a_f th:nth-child(3)').css({'background-color': '#ace1af'}).css({'color': 'black'});",
                       "$('th:first-child').css({'text-indent': '-5px'});",
                       "$('tr:nth-child(1)').css({'color': 'black'});",
                       "$('tr:nth-child(2)').css({'color': 'black'});",
                       "$('tr:nth-child(3)').css({'color': 'black'});",
                       "$('tr:nth-child(4)').css({'color': 'black'});",
                       "$('tr:nth-child(5)').css({'color': 'black'});",
                       "$('#tbl_a_f tr:nth-child(12) td:first-child').css({'text-indent': '30px'});",
                       "$('tr:nth-child(13) td:first-child').css({'text-indent': '30px'});",
                       "$('tr:nth-child(7) td:first-child').css({'text-indent': '30px'});",
                       "$('tr:nth-child(8) td:first-child').css({'text-indent': '30px'});",
                       "$('tr:nth-child(9) td:first-child').css({'text-indent': '30px'});",
                       "$('tr:nth-child(10) td:first-child').css({'text-indent': '30px'});",
                       "$('tr:nth-child(11) td:first-child').css({'text-indent': '30px'});",
                       "$('tr:nth-child(14) td:first-child').css({'text-indent': '30px'});",
                       "$('tr:nth-child(15) td').css({'border-top-width': 'medium'});",
                       "}")),
      
      callback = JS("table.rows().every(function(i, tab, row) {
                    var $this = $(this.node());
                    $this.attr('id', this.data()[0]);
                    $this.addClass('shiny-input-radiogroup');
  });
                    Shiny.unbindAll(table.table().node());
                    Shiny.bindAll(table.table().node());"),
    )
    
    
    
    
    #############################################     first table  ###############################################
    
    o1 <- "This checklist will provide key CX-related practices you should consider as part of your initial work. Once completed, it will generate a score and indicate the CX practices you could further explore to make your initiative more client-centric. You can use your score as discussion points to inform staff, colleagues or senior management."
    o2 <- "This checklist will assess the use of client insights and CX-related practices for your current initiative. Once completed, it will generate a score and indicate the CX practices you could further explore to make your initiative more client-centric. You can use your score as discussion points to inform staff, colleagues or senior management."
    #ot <- data.table('Planning a new initiative' = o1, 'Leading an existing initiative' = o2)
    
    
    output$firstcheck = DT::renderDataTable({     
      
      jsc3 <- '
    function(settings, json) {
      $("#firstcheck td:contains(\'Option 1\')").css("text-align", "left").css("background-color", "#248c84").css("color","black").css("font-family", "Arial").css("font-weight", "bold").css("line-height", "2.5").css("font-size", "26").css("text-indent", "10px");
      $("#firstcheck thead").css("text-align", "left").css("background-color", "#248c84").css("color","blue").css("font-family", "Arial").css("font-weight", "bold").css("line-height", "2.5").css("font-size", "26").css("text-indent", "10px");
      $("#firstcheck  td:first-child").css("width", "850px");
      $("#firstcheck  td:nth-child(2)").css("width", "850px");
      $("#firstcheck td").css("border","1px solid black").css("padding", "20px");
      $("#firstcheck th").css("border","1px solid black").css("background-color", "lightgray");
      $("#firstcheck tbody > tr:first-child").css("padding", "20px").css("color", "black").css("vertical-align", "top");
    }'
      
      ot <- data.frame("Planning a new initiative" = o1, "Leading an existing initiative" = o2)
      
      ot <- datatable(ot,
                      #container = myContainer,
                      selection="none",
                      rownames = F,
                      #width = '1600px',
                      class = "cell-border wrap compact",
                      escape = TRUE,
                      filter = "none",
                      #colnames = c("", ""),
                      #extensions = list("ColReorder" = NULL, "Buttons" = NULL),
                      options = list(
                        dom = 't', ordering = F,
                        autoWidth=FALSE,
                        ColReorder = FALSE,
                        preDrawCallback = JS('function() { Shiny.unbindAll(this.api().table().node()); }'),
                        drawCallback = JS('function() { Shiny.bindAll(this.api().table().node()); } '),
                        initComplete = JS(jsc3)
                      ),
                      colnames = c("[Option 1] Planning a new initiative", "[Option 2] Leading an existing initiative")
                      
                      
      ) %>% formatStyle('Planning.a.new.initiative', lineHeight="120%", target= "row")
      
      
      ot
    })
    
    
    
    ################# section A complete resources   ################################################################################
    
    
    observeEvent(input$complete,{
      output$warningai = renderText({
        t1 <- "Please consult the following resources to start shaping your initiative in the most client-centric way:"
        t1
        
      })
    })
    
              observeEvent(input$complete_f,{
                output$warningai_f = renderText({
                  t1 <- HTML(paste("Veuillez consulter les ressources suivantes pour commencer &agrave; fa&ccedil;onner votre initiative de la mani&egrave;re la plus centr&eacute;e sur le client possible :"))
                  t1
                  
                })
              })
        
    
   
    
     observeEvent(input$complete,{
        output$warninga1 <- renderUI({
                  
             div(HTML("<p><li><a href='https://esdc.prv/en/service-canada/csb/client-experience-survey.shtml'>ESDC CX Survey results</a></p></li>"))
                  
          }
       )
   })
              
              
              observeEvent(input$complete_f,{
                output$warninga1_f <- renderUI({
                  
                  div(HTML(paste("<p><li><a href='https://esdc.prv/fr/service-canada/csb/client-experience-survey.shtml'>R&eacute;sultats du sondage sur l'EC men&eacute; par EDSC</a></p></li>")))
                  
                }
                )
              })
              
    
    observeEvent(input$complete,{
      output$warninga2 <- renderUI({
        
        div(HTML("<p><li><a href='https://ceacs-cesca.github.io/playbook/index.html'>AccessAbility Playbook: Barrier-free access for everyone</a></p></li>"))
        
      }
      )
    })
    
    
                observeEvent(input$complete_f,{
                  output$warninga2_f <- renderUI({
                    
                    div(HTML(paste("<p><li><a href='https://ceacs-cesca.github.io/playbook/index.html'>Guide de l'accessibilit&eacute; : Un acc&egrave;s sans obstacles pour tous </a></p></li>")))
                    
                  }
                  )
                })
    
    
    observeEvent(input$complete,{
      output$warninga3 <- renderUI({
        
        div(HTML("<p><li><a href='https://esdc.prv/en/service-canada/csb/sd/cibi.shtml'>CX Centre of Expertise</a></p></li>"))
        
      }
      )
    })
    
              
              observeEvent(input$complete_f,{
                output$warninga3_f <- renderUI({
                  
                  div(HTML("<p><li><a href='https://esdc.prv/fr/service-canada/csb/sd/cibi.shtml'>Centre d'expertise de l'EC</a></p></li>"))
                  
                }
                )
              })
    
    
    
    table_input1 <- eventReactive(input$report,
                                  {input$cbox_3}
    )
    
    output$table_ti <- renderText(
      table_input1()
    )
    
    observeEvent(input$report, {
      x <- table_input1()
      filename <- paste0("CX Assessment Results - ",x)
      screenshot(filename = filename)
      #screenshot(selector="#myplot")
      #create id for panel
    })
    

    observeEvent(input$report2, {
      x <- table_input2()
      filename <- paste0("CX Assessment Results - ",x)
      screenshot(selector="#total", filename = filename)
      #screenshot(selector="#myplot")
      #create id for panel
    })
    

  

   
    
    
  }
)








