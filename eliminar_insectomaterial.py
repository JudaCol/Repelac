from PyQt5 import QtCore, QtGui, QtWidgets, uic
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *
from PyQt5.QtCore import *
import MySQLdb as mdb
import registro_insectomaterial
import sys
import xlsxwriter as xls
import opciones_insectomaterial
import administrar_insectomaterial
import actualiza_insectomaterial
import elimina_insectomaterial

class Ui_EliminarWindow(QtWidgets.QMainWindow):
    def __init__(self, insecto, material):
        super(Ui_EliminarWindow, self).__init__()  # Call the inherited classes __init__ method
        uic.loadUi('eliminar_insectomaterial.ui', self)
        self.show()
        self.redefineWindow()
        self.boton_acciones()
        self.insecto = int(insecto)
        self.material = int(material)
        self.listar()
        self.consulta = ""

    def redefineWindow(self):
        self.setFixedSize(1374, 508)
        self.setWindowIcon(QtGui.QIcon('logo.png'))
        header = self.tableWidget.horizontalHeader()
        header.setSectionResizeMode(0, QtWidgets.QHeaderView.ResizeToContents)
        header.setSectionResizeMode(1, QtWidgets.QHeaderView.Stretch)
        header.setSectionResizeMode(2, QtWidgets.QHeaderView.ResizeToContents)
        header.setSectionResizeMode(3, QtWidgets.QHeaderView.ResizeToContents)
        header.setSectionResizeMode(4, QtWidgets.QHeaderView.ResizeToContents)
        header.setSectionResizeMode(5, QtWidgets.QHeaderView.ResizeToContents)
        header.setSectionResizeMode(6, QtWidgets.QHeaderView.ResizeToContents)
        header.setSectionResizeMode(7, QtWidgets.QHeaderView.ResizeToContents)
        header.setSectionResizeMode(8, QtWidgets.QHeaderView.Stretch)
        self.tableWidget.cellClicked.connect(self.click_row)

    def click_row(self, row, column):
        datas = []
        for i in range(9):
            item = self.tableWidget.item(row, i)
            data = item.text()
            datas.append(data)
        self.ui = elimina_insectomaterial.Ui_EliminaWindow(datas)


    def boton_acciones(self):
        self.pushButton.clicked.connect(self.atras)


    def listar(self):
        con = mdb.connect('localhost', 'root', '', 'quimica')
        with con:
            cur = con.cursor()
            try:
                if self.insecto == 0 and self.material != 0:
                    query = "SELECT nombre_insecto, nombre_compuesto, perioprotec, porcerepele, porcentlanding, porcentbiting, porceconcetracion, tiempotest, nombre_articulo from t_insectoscompuestos" \
                            " inner join t_insectos on t_insectoscompuestos.id_insecto = t_insectos.id_insecto" \
                            " inner join t_compuestos on t_insectoscompuestos.id_compuesto = t_compuestos.id_compuesto" \
                            " where t_compuestos.id_compuesto = {}".format(self.material)
                elif self.material == 0 and self.insecto != 0:
                    query = "SELECT nombre_insecto, nombre_compuesto, perioprotec, porcerepele, porcentlanding, porcentbiting, porceconcetracion, tiempotest, nombre_articulo from t_insectoscompuestos" \
                            " inner join t_insectos on t_insectoscompuestos.id_insecto = t_insectos.id_insecto" \
                            " inner join t_compuestos on t_insectoscompuestos.id_compuesto = t_compuestos.id_compuesto" \
                            " where t_insectos.id_insecto = {}".format(self.insecto)
                elif self.material == 0 and self.insecto == 0:
                    query = "SELECT nombre_insecto, nombre_compuesto, perioprotec, porcerepele, porcentlanding, porcentbiting, porceconcetracion, tiempotest, nombre_articulo from t_insectoscompuestos" \
                            " inner join t_insectos on t_insectoscompuestos.id_insecto = t_insectos.id_insecto" \
                            " inner join t_compuestos on t_insectoscompuestos.id_compuesto = t_compuestos.id_compuesto" \
                            " where t_insectos.id_insecto = t_insectoscompuestos.id_insecto and t_compuestos.id_compuesto = t_insectoscompuestos.id_compuesto"
                else:
                    query = "SELECT nombre_insecto, nombre_compuesto, perioprotec, porcerepele, porcentlanding, porcentbiting, porceconcetracion, tiempotest, nombre_articulo from t_insectoscompuestos" \
                            " inner join t_insectos on t_insectoscompuestos.id_insecto = t_insectos.id_insecto" \
                            " inner join t_compuestos on t_insectoscompuestos.id_compuesto = t_compuestos.id_compuesto" \
                            " where t_insectos.id_insecto = {} and t_compuestos.id_compuesto = {}".format(self.insecto, self.material)

                data = cur.execute(query)
                rows = cur.fetchall()
                if len(rows) == 0:
                    QMessageBox.about(self, 'Consulta', 'No hay registros que cumplan el criterio de búsqueda')
                    self.close()
                    self.ui = administrar_insectomaterial.Ui_AdministrarWindow()
                else:
                    n_rows = len(rows)
                    self.tableWidget.setRowCount(n_rows)
                    for idx, row in enumerate(rows):
                        for j in range(9):
                            item = QTableWidgetItem(str(row[j]))
                            item.setFlags(QtCore.Qt.ItemIsEnabled)
                            item.setBackground(QtGui.QColor(69, 179, 157))
                            self.tableWidget.setItem(idx, j, item)
            except Exception as e:
                print(e)
            finally:
                pass


    def atras(self):
        self.insecto = ""
        self.material = ""
        self.close()
        self.ui = administrar_insectomaterial.Ui_AdministrarWindow()


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    ui = Ui_EliminarWindow()
    app.exec_()
