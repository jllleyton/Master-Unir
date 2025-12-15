import matplotlib.pyplot as plt

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