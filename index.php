<!DOCTYPE html>
<html>
    <head>
        <title>Plataforma Aprendizagem em Movimento</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="">
        
        <link href="./recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="./recursos/bootstrap/css/bootstrap-theme.css" rel="stylesheet">
        <link rel="stylesheet" href="./recursos/font-awesome/css/font-awesome.min.css">
        
        <style>
        html,body{            
            height: 100%;
            min-height: 100%;
            background-position: left top;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
            background-size: cover;
            
        }
        
        
        html{
            background: url(img/bg/map_3.png)no-repeat center center fixed; 
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
        }    
        @media (min-width: 720px){
            html{
                background: url(img/bg/map_3_big.png)no-repeat center center fixed; 
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
                
            }
        }

        
	body {
                padding-bottom: 60px;
                background: rgba(200,200,255,0.2);
	}
        
        @media (min-width: 992px) {
             .col-md-4 > .panel > .panel-body {
                min-height: 180px;
            }
            .col-lg-4 > .panel > .panel-body {
                min-height: 220px;
            }
        }

        #footer {
            position: absolute;
            bottom: 0;
            //width: auto;
            /* Set the fixed height of the footer here */
            height: 30px;
            background-color: rgba(200,200,255,0.7);
        }

        #footer > .container {
            padding-right: 15px;
            padding-left: 15px;
        }
        
	</style>
    </head>
    <body>
        <div class="container">
            <div class="page-header" >
                <div class="hidden-xs hidden-sm">
                    <h1>
                        <i class="fa fa-graduation-cap"></i><strong> Plataforma Aprendizagem em Movimento </strong>
                        <small style="color: #428bca;">Open Source LGPL</small>
                    </h1>
                </div>
                <div class="hidden-lg hidden-md">
                    <h3>
                        <small style="color: #428bca;"><i class="fa fa-graduation-cap"></i> Plataforma Open Source LGPL </small>
                        <strong>Aprendizagem em Movimento </strong>
                    </h3>    
                </div>
            </div>
            <div class="row">
                <div class="container-fluid">
                    
                    <div class="col-lg-4  col-md-4">

                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h2  class="panel-title" ><i class="fa fa-cogs"></i> Editor </h2>
                            </div>
                            <div class="panel-body text-justify">
                                Edite Veículos de comunicação lcativos adequados a suas necessidades, com as regras específicas para usa arquitetura pedagógica.
                            </div>
                            <div class="panel-footer">
                                <div class="container-fluid text-justify">
                                    <div class="container-fluid text-justify">
                                        <a class="btn-link  center-block hidden-xs " href="https://github.com/LocationBasedCMS/editor.plataformaam.com" ><i class="fa fa-github"></i> Código Fonte</a>
                                    </div>
                                    <a class="btn btn-primary center-block" href="http://editor.plataformaam.com"><i class="fa fa-edit"></i> Editar!</a>
                                </div>
                            </div>
                        </div>

                    </div>                    
                    

                    <div class="col-lg-4  col-md-4  ">

                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h2 class="panel-title" ><i class="fa fa-mobile"></i> Cliente Móvel </h2>
                            </div>
                            <div class="panel-body text-justify">
                                Estimule seus estudantes com passeios pedagógico. O Cliente  Móvel permitirá a navegação por um Veículo de comunicação Locativo, interagindo com um ambiente de realidade aumentada a partir das coordenadas do GPS.
                            </div>
                            <div class="panel-footer">
                                <div class="container-fluid text-justify">
                                    <div class="container-fluid text-justify">
                                        <a class="btn-link pull-left hidden-xs " href="https://github.com/LocationBasedCMS/android.mobile.plataformaam.com" ><i class="fa fa-github"></i> Android </a>
                                        <a class="btn-link pull-right hidden-xs " href="https://github.com/LocationBasedCMS/api.plataformaam.com" ><i class="fa fa-github"></i> WebService </a>
                                        
                                    </div>
                                    <a class="btn btn-default center-block" href="#"><i class="fa fa-group"></i> Em Breve !</a>
                                </div>
                            </div>
                        </div>                      

                    </div>

                    <div class="col-lg-4  col-md-4">

                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h2  class="panel-title" ><i class="fa fa-graduation-cap"></i> Painel Pedagógico </h2>
                            </div>
                            <div class="panel-body text-justify">
                                Acompanhe os estudantes em seu veículo de comunicação locativo. Fique por dentro das atualizações e interações e tenha uma visão em tempo real do que acontece.
                            </div>
                            <div class="panel-footer">
                                <div class="container-fluid text-justify">
                                    <div class="container-fluid text-justify">
                                        <a class="btn-link center-block hidden-xs " href="https://github.com/LocationBasedCMS/painelpedagogico.plataformaam.com" ><i class="fa fa-github"></i> Código Fonte</a>
                                    </div>
                                    <a class="btn btn-primary center-block" href="http://painelpedagogico.plataformaam.com"><i class="fa fa-eye"></i> Avaliar !</a>
                                </div>   
                            </div>
                        </div>                              

                    </div>

                     
                </div>



            </div>
            <!-- Link para os Códigos Fontes  Nas Versões  telas PEquenas -->
            <div class="row">
                <div class="col-lg-4  col-md-4">
                    <div class="container-fluid hidden-lg hidden-md">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <h2  class="panel-title" ><i class="fa fa-files-o"></i> Códigos Fontes</h2>
                                </div>
                                <div class="panel-body text-justify">
                                    <p><a class="btn-link" href="https://github.com/LocationBasedCMS/android.mobile.plataformaam.com" ><i class="fa fa-github"></i> Cliente Móvel (Android) </a></p>
                                    <p><a class="btn-link" href="https://github.com/LocationBasedCMS/api.plataformaam.com" ><i class="fa fa-github"></i> Cliente Móvel (Webservice) </a></p>
                                    <p><a class="btn-link" href="https://github.com/LocationBasedCMS/painelpedagogico.plataformaam.com" ><i class="fa fa-github"></i> Painel Pedagógico </a></p>
                                    <p><a class="btn-link" href="https://github.com/LocationBasedCMS/editor.plataformaam.com" ><i class="fa fa-github"></i> Editor de VCLoc </a></p>
                                </div>
                                <div class="panel-footer  text-justify">
                                    <p><a target="_blank" href='http://lied.inf.ufes.br/' class="btn-link"><i class="fa fa-university" ></i> LIEd - UFES</a></p>
                                    <p><i class="fa fa-bug" ></i> Por <a target="_blank" href='http://www.linkedin.com/profile/view?id=223308442&trk=spm_pic' class="btn-link">Bernard C. Pereira.</a></p>
                                </div>
                            </div>    
                    </div>
                </div>
            </div>
        </div>

        <div  class="hidden-xs  navbar navbar-fixed-bottom  col-lg-offset-1 col-lg-10 col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 ">
            <div class="row">
                <span class="pull-left">
                    <a target="_blank" href='http://lied.inf.ufes.br/' class="btn-link">&nbsp;&nbsp; Laboratótio de Informatíca na Educação - UFES &nbsp;&nbsp;</a>
                </span>
                <span class="pull-right">
                    &nbsp;&nbsp;Desenvolvido por <a target="_blank" href='http://www.linkedin.com/profile/view?id=223308442&trk=spm_pic' class="btn-link">Bernard C. Pereira.&nbsp;&nbsp;</a>
                </span>
            </div>
        </div>
        

        
        
        
        <script src="./recursos/jquery/jquery-1.11.1.min.js"></script>
        <script src="./recursos/jquery/jquery-1.11.1.min.map"></script>
        <script src="./recursos/bootstrap/js/bootstrap.min.js"></script>
        <script src="./recursos/bootstrap/js/docs.min.js"></script>
    </body>
</html>
