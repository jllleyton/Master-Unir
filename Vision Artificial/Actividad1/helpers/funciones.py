import numpy as np
import cv2

def read(file):
    imagen = cv2.imread(file)
    if imagen is None:
        print("Error: No se pudo leer la imagen. Verifica el formato y la ruta.")
        return False
    img_gray = cv2.cvtColor(imagen, cv2.COLOR_BGR2GRAY)
    return img_gray    

def write(file,image):
  cv2.imwrite(file, image)


def gamma(image, gamma=0.3):
  print(gamma)
  img_norm = image /255.0
  img_gamma = np.power(img_norm  , gamma)
  return  np.uint8(img_gamma * 255)   

def log_transform(image):
  image_norm = image / 255.0
  log_img = np.log1p(image_norm)
  log_img = log_img / np.max(log_img)
  return np.uint8(log_img * 255)

def sigmoid_transform(image, a=15, b=0.25):
    image_norm = image / 255.0
    sigmoid = 1 / (1 + np.exp(-a * (image_norm - b)))
    return np.uint8(sigmoid * 255)

def highlight_compression(image):
    img_norm = image / 255.0
    compressed = np.log1p(5 * img_norm) / np.log1p(5)
    return np.uint8(compressed * 255)

def clahe(imagen):
    # evita sobre-realce
    clahe = cv2.createCLAHE(clipLimit=2.0,tileGridSize=(8,8))
    return clahe.apply(imagen)