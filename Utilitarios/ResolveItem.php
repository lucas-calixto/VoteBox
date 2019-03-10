<?php

class ResolveItem {

    private $itens;

    function __construct($itens) {
        $this->itens = $itens;
    }

    public function resolve($tipo, $id, $obrigatorio) {

        switch ($tipo) {
            case "1":
                $cont = 0;
                foreach ($this->itens as $item) {
                    $htmlObrigatorio = "";
                    if ($obrigatorio == 1 && $cont == 0) {
                        $htmlObrigatorio = 'required=""';
                    }
                    echo "<div class=\"radio\">";
                    echo "<label>";
                    echo "<input type=\"radio\" id=\"optionsRadios1\" value=\"" . $item->getId_itens_pergunta() . "\" name=\"radio-" . $id . "\" " . $htmlObrigatorio . " />";
                    echo $item->getDescricao();
                    echo "</label>";
                    echo "</div>";
                    $cont++;
                }
                break;
            case "2":
                foreach ($this->itens as $item) {
                    echo "<div class=\"checkbox\">";
                    echo "<label>";
                    echo "<input type=\"checkbox\" value=\"check" . $id . "\" />";
                    echo $item->getDescricao();
                    echo "</label>";
                    echo "</div>";
                }
                break;
            case "3":
                $htmlObrigatorio = "";
                if ($obrigatorio == 1) {
                    $htmlObrigatorio = 'required=""';
                }
                echo "<div class=\"form-group\">";
                echo "<input type=\"text\" value=\"\" name=\"texto-" . $id . "\" class=\"form-control\" id=\"texto\" placeholder=\"\" " . $htmlObrigatorio . " />";
                echo "</div>";
                break;
            case "4":
                $htmlObrigatorio = "";
                if ($obrigatorio == 1) {
                    $htmlObrigatorio = 'required=""';
                }
//                echo "<input type=\"range\" list=\"tickmarks\" min=\"1\" max=\"5\" value=\"2\" name=\"escala-" . $id . "\">";
//                echo "<datalist id=\"tickmarks\">";
//                echo "<option value=\"1\" label=\"1\">";
//                echo "<option value=\"2\">";
//                echo "<option value=\"3\">";
//                echo "<option value=\"4\">";
//                echo "<option value=\"5\" label=\"5\">";
//                echo "</datalist>";
                echo "<input id=\"rankStar\" name=\"escala-" . $id . " type=\"number\" class=\"rating\" " . $htmlObrigatorio . " />";
                break;
            case "5":
                $cont = 0;
                foreach ($this->itens as $item) {
                    $htmlObrigatorio = "";
                    $contT = 0;
                    if ($obrigatorio == 1 && $cont == 0) {
                        $htmlObrigatorio = 'required=""';
                    }
                    if ($cont == 0 or $cont == 4) {
                        echo "<div class=\"row\">";
                    }
                    echo "<div class=\"col-md-3 col-xs-12\">";
                    echo "<div class=\"thumbnail\">";
                    echo "<img src=\"imagens/uploads/" . $item->getImagem() . "\" alt=\"\" class=\"img-responsive\" title=\"\" />";
                    echo "<div class=\"caption\">";
                    echo "<div class=\"radio\">";
                    echo "<label>";
                    echo "<input type=\"radio\" name=\"radio-" . $id . "\" id=\"\" value=\"" . $item->getId_itens_pergunta() . "\" " . $htmlObrigatorio . " />" . $item->getDescricao();
                    echo "</label>";
                    echo "</div>";
                    echo "</div>";
                    echo "</div>";
                    echo "</div>";
                    if ($cont == 3 or $cont == 7) {
                        echo "</div>";
                    }
                    $cont++;
                }
                break;
            default:
                echo '';
        }
    }

}
