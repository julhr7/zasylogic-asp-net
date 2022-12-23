<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClienteLista.aspx.cs" Inherits="Atencion_Cliente__.Net_Framework.Vista.ClienteLista" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.5.2.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            LISTADO DE CLIENTES ATENDIDOS<br />
            <br />
            Seleccionar el rango de fecha: <asp:TextBox ID="datepicker" runat="server" ReadOnly = "true"></asp:TextBox>
            <input type="button" value="Buscar" id="btnBuscar" />
            <br />
            <table id="tblCliente" class="tblDatos">
                <thead>
                    <tr>
                    <th class="thDatos">Nombre</th>
                    <th class="thDatos">Apellidos</th>
                    <th class="thDatos">Teléfono Celular</th>
                    <th class="thDatos">Email</th>
                    <th class="thDatos">Sexo</th>
                    <th class="thDatos">Motivo</th>
                    <th class="thDatos">Fecha</th>
                </tr>
                </thead>
                <tbody id="tabla"></tbody>
            </table>
        </div>
    </form>
</body>
    <script>
        $(function () {
            $("#datepicker").datepicker({
                numberOfMonths: 2,
                showButtonPanel: true,
                dateFormat: 'dd/mm/yy'
            });
        });
        $(function () {
            $('#btnBuscar').click(function () {
                var valfecha = $('#datepicker').val();

                var oData = {
                    fecha: valfecha
                }

                $.ajax({
                    type: "POST",
                    url: "ClienteLista.aspx/Consultar",
                    data: JSON.stringify(oData),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (resultado) {
                        var items = resultado.d;
                        $('#tabla').empty();
                        $.each(items, function (index, item) {
                            $('#tabla').append(
                                "<tr><td>" + item.nombres + "</td>"
                                + "<td Class='tdDatos'>" + item.apellidos + "</td>"
                                + "<td Class='tdDatos'>" + item.celular + "</td>"
                                + "<td Class='tdDatos'>" + item.email + "</td>"
                                + "<td Class='tdDatos'>" + item.descSexo + "</td>"
                                + "<td Class='tdDatos'>" + item.descMotivo + "</td>"
                                + "<td Class='tdDatos'>" + item.fecha + "</td>"
                                + "</tr>"
                            );
                        });
                    },
                    error: errores
                });
            });
        });
        function errores(msg) {
            alert('Error: ' + msg.responseText);
        }
    </script>
</html>
