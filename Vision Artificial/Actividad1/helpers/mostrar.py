import matplotlib.pyplot as plt
import numpy as np

def mostrar(imagenOriginal, imagenProcesada):
    # --- Crear figura ---
    plt.figure(figsize=(12, 6))

    # Fila 1 - Imágenes
    plt.subplot(2, 2, 1)
    plt.imshow(imagenOriginal)
    plt.title("Imagen original")
    plt.axis("off")

    plt.subplot(2, 2, 2)
    plt.imshow(imagenProcesada)
    plt.title("Imagen procesada")
    plt.axis("off")

    # Fila 2 - Histogramas
    plt.subplot(2, 2, 3)
    plt.hist(imagenOriginal.ravel(), bins=256, range=[0,256])
    plt.title("Histograma original")

    plt.subplot(2, 2, 4)
    plt.hist(imagenProcesada.ravel(), bins=256, range=[0,256])
    plt.title("Histograma procesada")

    plt.tight_layout()
    plt.show()

def mostrarNormalizado(imagenOriginal, imagenProcesada):
    # Normalizar para mostrar la imagen transformada correctamente
    #I_log_norm = cv2.normalize(I_log, None, 0, 255, cv2.NORM_MINMAX)
    #I_log_norm = I_log_norm.astype(np.uint8)
    # Normalizar al rango [0, 255] para visualizar
    I_log_norm = (imagenProcesada - np.min(imagenProcesada)) / (np.max(imagenProcesada) - np.min(imagenProcesada)) * 255
    I_log_norm = I_log_norm.astype(np.uint8)

    def calc_hist(img, nbins=512):
      hist, _ = np.histogram(img.flatten(), bins=nbins, range=[0, 256])
      hist = hist / img.size   # normalización
      return hist

    nbins = 512
    hist_original = calc_hist(imagenOriginal.astype(np.uint8), nbins)
    hist_log = calc_hist(I_log_norm, nbins)
    # Rango de intensidades
    r = np.linspace(0, 255, nbins)


    # --- Crear figura ---
    plt.figure(figsize=(12, 6))

    # Fila 1 - Imágenes
    plt.subplot(2, 2, 1)
    plt.imshow(imagenOriginal, cmap='gray')
    plt.title("Imagen original")
    plt.axis("off")

    plt.subplot(2, 2, 2)
    plt.imshow(imagenProcesada, cmap='gray')
    plt.title("Imagen procesada")
    plt.axis("off")

    # Fila 2 - Histogramas
    plt.subplot(2, 2, 3)
    plt.plot(r, hist_original)
    plt.title('Histograma Imagen Original')
    plt.xlabel('Intensidad')
    plt.ylabel('Frecuencia Normalizada')

    plt.subplot(2, 2, 4)
    plt.plot(r, hist_log)
    plt.title('Histograma Imagen Logarítmica')
    plt.xlabel('Intensidad')
    plt.ylabel('Frecuencia Normalizada')
    
    plt.tight_layout()
    plt.show()