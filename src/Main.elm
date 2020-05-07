module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import SmoothScroll exposing (scrollTo)
import Task exposing (Task)



---- MODEL ----


type alias Flags =
    { images :
        { main : String
        , code : String
        , keyboard : String
        }
    }


type alias Model =
    { flags : Flags
    }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { flags = flags }, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp
    | SmoothScroll String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        SmoothScroll id ->
            ( model, Task.attempt (always NoOp) (scrollTo id) )



---- VIEW ----


view : Model -> Browser.Document Msg
view model =
    { title = "Craig Handley"
    , body =
        [ {--Header--}
          header [ id "header" ]
            [ div [ class "logo" ]
                [ div []
                    [ p [] [ text "Craig Handley" ]
                    , span [] [ text "full stack software engineer" ]
                    ]
                ]
            ]

        {--Main--}
        , section [ id "main" ]
            [ div [ class "inner" ]
                {--Top--}
                [ section [ id "top", class "wrapper style1" ]
                    [ div [ class "image fit flush" ]
                        [ img [ src model.flags.images.main ] []
                        ]
                    , header [ class "special" ]
                        [ h2 [] [ text "About Me" ]

                        -- , p [] [ text "vehicula urna sed justo bibendum" ]
                        ]
                    , div [ class "content" ]
                        [ p [] [ text "I am an enterprising, motivated and passionate software engineer with experience of delivering applications and leading engineering teams across a wide variety of sectors for over 20 years." ]
                        , p [] [ text "Throughout my career i've tried to remain on the cutting edge of technology trends, which means I have a broad range of skills and knowledge of technology." ]
                        , p [] [ text "I also have a great deal of experience with mentoring other engineers as well a working in a team lead role directly managing teams as well as individuals." ]
                        , p [] [ text "I have experience in agile methodologies, continuous integration and am comfortable reporting up and down any organisation." ]
                        , p [] [ text "My versatility and aptitude are such that I can comfortably work directly with clients gathering requirements and rapidly developing solutions or work on my own designing and developing well structured applications." ]
                        , p [] [ text "Outside of work I enjoy sporting activities such as Football and Badminton, I also keep Marine fish and lots of my spare time is taken up by breeding and raising Clownfish and Seahorses." ]
                        , p [ class "link", onClick (SmoothScroll "_CONTACT_ME_") ] [ text "Contact Me" ]
                        ]
                    ]

                {--Skillset/Contact--}
                , section [ id "skillset", class "wrapper" ]
                    [ div [ class "spotlight alt" ]
                        [ div [ class "image flush" ]
                            [ img [ src model.flags.images.keyboard ] []
                            ]
                        , div [ class "inner" ]
                            [ h3 [] [ text "My Main Skillset" ]
                            , p [] [ text "Java" ]
                            , p [] [ text "Node JS" ]
                            , p [] [ text "Elm" ]
                            , p [] [ text "Amazon Web Services" ]
                            , p [] [ text "Technical Leadership" ]
                            , p [ class "link", onClick (SmoothScroll "_RESUME_") ] [ text "View Full Resume" ]
                            ]
                        ]
                    , div [ class "spotlight" ]
                        [ div [ class "image flush" ]
                            [ img [ src model.flags.images.code ] []
                            ]
                        , div [ id "_CONTACT_ME_", class "inner" ]
                            [ h3 [] [ text "Contact Me" ]
                            , div [] [ text "Email me at" ]
                            , a [ href "mailto:mr.craig.handley@googlemail.com", target "_blank" ] [ text "mr.craig.handley@googlemail.com" ]
                            , div [ class "extra-top-margin" ] [ text "Send me a message on" ]
                            , a [ href "https://www.linkedin.com/in/craig-handley-73966328/", target "_blank" ] [ text "LinkedIn" ]
                            ]
                        ]

                    -- , div [ class "spotlight alt" ]
                    --     [ div [ class "image flush" ]
                    --         [ img [ src model.flags.images.pic08 ] []
                    --         ]
                    --     , div [ class "inner" ]
                    --         [ h3 [] [ text "Morbi Eleifend" ]
                    --         , p [] [ text "Curabitur eget semper ante. Morbi eleifend ultricies est, a blandit diam vehicula vel. Vestibulum porttitor nisi quis viverra hendrerit. Suspendisse vel volutpat nibh, vel elementum lacus. Maecenas commodo pulvinar dui, at cursus metus imperdiet vel." ]
                    --         ]
                    --     ]
                    ]

                {--Three--}
                -- , section [ id "three", class "wrapper style2" ]
                --     [ header []
                --         [ h2 [] [ text "Vestibulum Convallis" ]
                --         , p [] [ text "vehicula urna sed justo bibendum" ]
                --         ]
                --     , div [ class "content" ]
                --         [ div [ class "gallery" ]
                --             [ div []
                --                 [ div [ class "image fit flush" ]
                --                     [ img [ src model.flags.images.pic03 ] []
                --                     ]
                --                 ]
                --             , div []
                --                 [ div [ class "image fit flush" ]
                --                     [ img [ src model.flags.images.pic02 ] []
                --                     ]
                --                 ]
                --             , div []
                --                 [ div [ class "image fit flush" ]
                --                     [ img [ src model.flags.images.pic04 ] []
                --                     ]
                --                 ]
                --             , div []
                --                 [ div [ class "image fit flush" ]
                --                     [ img [ src model.flags.images.pic05 ] []
                --                     ]
                --                 ]
                --             ]
                --         ]
                --     ]
                , {--Resume--}
                  section [ id "_RESUME_", class "wrapper style1" ]
                    [ header [ class "special" ]
                        [ h2 [] [ text "My Resume" ]

                        -- , p [] [ text "vehicula urna sed justo bibendum" ]
                        ]
                    , div [ class "content resume" ]
                        [ h3 [] [ text "Work Experience" ]
                        , h4 [] [ text "SENIOR SOFTWARE ENGINEER / ENGINEERING TEAM LEAD" ]
                        , h5 [] [ text "Click Travel Ltd, 2013 - present" ]
                        , p [] [ text "I currently work as a full stack senior software engineer, designing and developing services that form part of a framework for enterprise applications backed by Amazon Web Services using domain driven design. Bounded contexts are realised as micro services which are integrated using an event-driven architecture and expose a RESTful API. Services are created using Java and Node with a front end written in AngularJS and Elm." ]
                        , h4 [] [ text "DEVELOPMENT LEAD" ]
                        , h5 [] [ text "Celesio Group (UK), 2012 - 2013" ]
                        , p [] [ text "I managed a team of 6 permanent developers / senior developers. My responsibilities were in designing, developing and supporting software solutions, ensuring that these solutions are fit for purpose and sustainable in the long term. Also to manage the performance of a group of IT colleagues and develop their capability to fulfil their potential and deliver the organisation requirements of the system strategy." ]
                        , h4 [] [ text "CLINICAL SYSTEMS DEVELOPMENT MANAGER" ]
                        , h5 [] [ text "Lloyds Pharmacy Ltd, 2010 - 2012" ]
                        , p [] [ text "I managed a team of 7 permanent and 2 contract developers. I was responsible for the delivery of several store side, thick client Java applications (using the Scrum agile software development methodology) and a wide variety of application based at our head office created with various technologies. Developing, coaching and mentoring direct reports. Creation of personal development plans, setting of objectives and appraising." ]
                        , h4 [] [ text "DEVELOPER / SENIOR DEVELOPER" ]
                        , h5 [] [ text "Lloyds Pharmacy Ltd, 2000 - 2010" ]
                        , p [] [ text "Duties consist of designing, testing and implementation of bespoke software systems for over 1600 Lloyds Pharmacy stores in the UK, AAH Pharmaceutical warehouses and internal Management Information Systems. Working on RDBMS, utilities, reporting, financial, data collection and warehouse systems using MS Visual Basic, MS Access, MS SQL Server, Java and JSP." ]
                        , h4 [] [ text "ANALYST / PROGRAMMER" ]
                        , h5 [] [ text "Midland & General Direct Ltd, 2000" ]
                        , p [] [ text "Design and implementation of RDBMS using Omnis (Cross Platform, Object Oriented, 4GL RAD tool) front end to MS SQL Server 7 back end. Responsible for the conversion of the company’s databases from Omnis 7 to Omnis Studio. Development of Call Centre, Help Desk and Computer–Telephone Integration systems." ]
                        , h4 [] [ text "ANALYST / PROGRAMMER" ]
                        , h5 [] [ text "WS Atkins Defence Services Information Systems, 1998 - 2000" ]
                        , p [] [ text "Development of planned maintenance, stores handling, sub contractor and work registration systems using MS Access and Visual Basic. Worked closely with the company’s business analyst, visiting sites nationwide and attending meetings to discuss and finalise projects. In charge of setting up and maintaining the original hardware and software for pilot sites. Worked in Kosovo, setting up several NT Server networks for the British Armed Forces and also responsible for the training of the managerial and administration staff on the use of the system. Worked as part of a telephone helpdesk team for the sites, dealing with hardware, software and training issues. " ]
                        , h4 [] [ text "APPLICATIONS ENGINEER" ]
                        , h5 [] [ text "Ricoh UK Products Ltd, 1995 - 1998" ]
                        , p [] [ text "Design and implementation of RDBMS using MS Access. Responsible for the set-up, maintenance and troubleshooting of all hardware and software within the Engineering Department. In charge of the budgetary requirements for the Engineering Department with regards to IT. Responsible for the creation of technical drawings within the company on the 2D AutoCAD package and also on the 3D package Pro Engineer.." ]
                        , h4 [] [ text "CONTRACTS ASSISTANT" ]
                        , h5 [] [ text "Kitpac Buildings Ltd, 1993 - 1995" ]
                        , p [] [ text "Responsible for the full lifecycle of the buildings manufactured / sold and implementing IT within the company throughout all divisions. Design and implementation of IT solutions within the company, which allowed the creation and storage of technical drawings in electronic format. Designed several databases using MS Access to improve efficiency, companywide. Created technical drawings for our steelwork buildings, liaised with customers, visited sites to measure up and supervised the erection of the buildings. " ]
                        ]
                    , div [ class "content resume white-background-color" ]
                        [ h3 [] [ text "Education" ]
                        , h4 [] [ text "BSC (HONS) COMPUTING AND IT" ]
                        , p [] [ text "Open University, 2011 - 2017" ]
                        , h4 [] [ text "ANGULAR JS BOOT CAMP" ]
                        , p [] [ text "Oasis Digital Systems, 2017" ]
                        , h4 [] [ text "EFFECTIVE SPRING, HIBERNATE AND JAVA BEST PRACTICES" ]
                        , p [] [ text "Learning Tree, 2011" ]
                        , h4 [] [ text "SUN CERTIFIED JAVA PROGRAMMER" ]
                        , p [] [ text "Sun Microsystems, 2007" ]
                        , h4 [] [ text "LLOYDSPHARMACY MANAGEMENT PROGRAMME" ]
                        , p [] [ text "Internally run 12 month course, 2004 - 2005" ]
                        , h4 [] [ text "BTEC PROFESSIONAL DEVELOPMENT AWARD – APPLICATION PROGRAMMING IN VISUAL BASIC" ]
                        , p [] [ text "Cannock Chase Technical College, 2000 - 2001" ]
                        , h4 [] [ text "BTEC HIGHER NATIONAL CERTIFICATE IN COMPUTER SCIENCE" ]
                        , p [] [ text "Wolverhampton University, 1996 - 1998" ]
                        , h4 [] [ text "CITY & GUILDS QUALIFICATION IN AUTOCAD CUSTOMISATION AND SYSTEM MANAGEMENT" ]
                        , p [] [ text "Cannock Chase Technical College, 1995 - 1996" ]
                        , h4 [] [ text "CITY & GUILDS QUALIFICATION IN COMPUTER AIDED DRAUGHTING AND DESIGN USING AUTOCAD" ]
                        , p [] [ text "Cannock Chase Technical College, 1994 - 1995" ]
                        , h4 [] [ text "BTEC HIGHER NATIONAL DIPLOMA IN GRAPHIC DESIGN" ]
                        , p [] [ text "Wolverhampton University, 1991 - 1993" ]
                        , h4 [] [ text "BTEC NATIONAL DIPLOMA IN GRAPHIC DESIGN" ]
                        , p [] [ text "Stafford College, 1989 - 1991" ]
                        , h4 [] [ text "GCSE EXAMINATIONS" ]
                        , p [] [ text "Great Wyrley High School, 1989" ]
                        ]
                    ]
                ]
            ]

        {--Footer--}
        , footer [ id "footer" ]
            [ div [ class "container" ]
                [ ul [ class "icons" ]
                    [ li []
                        [ a [ href "https://github.com/craig-handley", class "fab fa-github fa-lg", target "_blank" ] []
                        ]
                    , li []
                        [ a [ href "https://www.linkedin.com/in/craig-handley-73966328/", class "fab fa-linkedin-in fa-lg", target "_blank" ] []
                        ]
                    , li []
                        [ a [ href "mailto:mr.craig.handley@googlemail.com", class "fas fa-envelope fa-lg", target "_blank" ] []
                        ]
                    ]
                ]
            , div [ class "copyright" ]
                [ text "© 2020 Craig Handley. All rights reserved." ]
            ]
        ]
    }



---- PROGRAM ----


main : Program Flags Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
