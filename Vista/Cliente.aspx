<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cliente.aspx.cs" Inherits="Atencion_Cliente__.Net_Framework.Vista.Cliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 141px;
        }
    </style>
    <link href="StyleSheet1.css" rel="stylesheet" />

</head>
<body>
    <table>
        <tr>
            <td>
                <form id="form1" runat="server">
        <div>
            FORMULARIO WEB DE ATENCION AL CLIENTE<br />
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Nombre:</td>
                    <td>
            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;Apellidos:
            </td>
                    <td>
            <asp:TextBox ID="txtApellidos" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Celular:
            </td>
                    <td>
            <asp:TextBox ID="txtCelular" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Email:
            </td>
                    <td>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Sexo:
            </td>
                    <td>
            <asp:RadioButton ID="optHombre" runat="server" Text="Hombre" GroupName="genero" />
            <asp:RadioButton ID="optMujer" runat="server" Text="Mujer" GroupName="genero" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Motivo:
            </td>
                    <td>
            <asp:DropDownList ID="cboMotivo" runat="server" Height="16px" Width="131px">
            </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
            <asp:Button ID="btnEnviar" runat="server" OnClick="Button1_Click" Text="Enviar" Width="278px" CssClass="btn" />
                       
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;
                       
                    </td>
                </tr>
            </table>
            <br />
        </div>         
    </form>
            </td>
        </tr>
        <tr>
            <td>
                 <br />
      <button id="open" style="width:278px"> Mostrar las Sentencias</button>
    <div id="modal_container" class="modal-container">
        <div class="modal">
            <h1>Sentencias SQL</h1>
            <p>
                CREATE PROCEDURE [dbo].[sp_cliente_sel]
	                @fecha VARCHAR(10)
                AS
                BEGIN
	                SELECT 
		                idAtencionCliente, nombres, apellidos, celular, email,
		                sexo, CASE WHEN sexo = 1 THEN 'Hombre' ELSE 'Mujer' END descSexo,
		                TatencionCliente.idMotivo, Tmotivo.descMotivo descMotivo, CONVERT(VARCHAR, fecha, 103) fecha
	                FROM TatencionCliente
	                INNER JOIN Tmotivo ON TatencionCliente.idMotivo = Tmotivo.idMotivo
	                WHERE (LEN(@fecha) > 0 AND CONVERT(VARCHAR, fecha, 103) = CONVERT(VARCHAR, @fecha, 103)) OR 
	                (LEN(@fecha) = 0 AND CONVERT(VARCHAR, fecha, 103) > CONVERT(VARCHAR, @fecha, 103))
                END
            </p>
            <p>
                CREATE PROCEDURE [dbo].[sp_cliente_ins] (
	                @nombres	VARCHAR(100),
	                @apellidos	VARCHAR(100),
	                @celular	VARCHAR(9),
	                @email		VARCHAR(100),
	                @sexo		INT,
	                @idMotivo	INT
                )
                AS
                BEGIN
	                DECLARE @rpt AS INT = 0
	                IF NOT EXISTS(SELECT * FROM TatencionCliente WHERE celular = @celular AND CONVERT(VARCHAR, fecha, 103) = CONVERT(VARCHAR, GETDATE(), 103))
		                BEGIN
			                SET @rpt = 1;
			                INSERT INTO TatencionCliente (nombres, apellidos, celular, email, sexo, idMotivo, fecha)
			                VALUES (@nombres, @apellidos, @celular, @email, @sexo, @idMotivo, GETDATE());
		                END
	                ELSE
		                SET @rpt = 0;
	
	                RETURN @rpt;
                END
            </p>
            <button id="close">Cerrar</button>
        </div>
    </div>
            </td>
        </tr>
    </table>
    
   
</body>
<script src="JavaScript.js"></script>
</html>
