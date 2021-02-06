from PyQt5 import QtCore, QtGui, QtWidgets, uic
from PyQt5.QtGui import *
from PyQt5.QtWidgets import *
from PyQt5.QtCore import *
import MySQLdb as mdb
from tabula import read_pdf
import pandas as pd

# conexion con la base de datos
# con = mdb.connect('localhost', 'root', '', 'reparc')
# with con:
#     cur = con.cursor()

# extraccion de tabla de repelecia y periodo de proteccion del articulo Efecto repelente de aceites esenciales contra mosquitos Aedes, Anopheles y Culex
df = read_pdf("Amer A _ Mehlora H Efecto repelente de aceites esenciales contra mosquitos Aedes, Anopheles y Culex.pdf", pages='4')
tabla_repelentes = pd.DataFrame(df[0])
names_Amer = tabla_repelentes['Name of material'][1:].to_list()
# para aedes
ae_pp = tabla_repelentes['Aedes'][1:].to_list()
ae_porc_r = tabla_repelentes['Unnamed: 0'][1:].to_list()
# para anopheles
an_pp = tabla_repelentes['Anopheles'][1:].to_list()
an_porc_r = tabla_repelentes['Unnamed: 1'][1:].to_list()
# para culex
cu_pp = tabla_repelentes['Culex'][1:].to_list()
cu_porc_r = tabla_repelentes['Unnamed: 2'][1:].to_list()
# extraccion de tabla de landingn y bitting del articulo Efecto repelente de aceites esenciales contra mosquitos Aedes, Anopheles y Culex
df = read_pdf("Amer A _ Mehlora H Efecto repelente de aceites esenciales contra mosquitos Aedes, Anopheles y Culex.pdf", pages='6')
tabla_repelentes = pd.DataFrame(df[0])
# para aedes
ae_pland = tabla_repelentes['Aedes'][1:].to_list()
ae_pbit = tabla_repelentes['Unnamed: 0'][1:].to_list()
# para anopheles
an_pland = tabla_repelentes['Anopheles'][1:].to_list()
an_pbit = tabla_repelentes['Unnamed: 1'][1:].to_list()
# para culex
cu_pland = tabla_repelentes['Culex'][1:].to_list()
cu_pbit = tabla_repelentes['Unnamed: 2'][1:].to_list()
# extraccion de tabla de repelecia y periodo de proteccion del articulo Mosquito repellency of EOs derived from Lao Plants
# df = read_pdf("Anderson K. 2010. Mosquito repellency of EOs derived from Lao Plants.pdf", pages='4')
# tabla_repelentes = pd.DataFrame(df[0])


