# High-Accuracy-Transfer-Learning-Based-Power-Quality-Disturbance-Recognition-Under-Noisy-Environment
the corresponding repository of High-Accuracy Transfer Learning-Based Power Quality Disturbance Recognition Under Noisy Environment

## citation
```
will be provided upon publication

```

## Env requirement
Python 3.6 and the following versioned packages were used for All codes:
- Keras >= 2.8.0
- matplotlib >= 3.3.4
- seaborn >= 0.11.1
  
open main _Code.ipynb by **Jupyter Notebook**  for better experience.
## Structure

- **Datasets**: Based on IEEE P1159.3 Task Force, mathematical definitions of different PQDs are used to provide 300 random sample signals for each twenty-nine PQD, seven single and twenty-two compound disturbances. Matlab file, pqmodel.m, for signal generation  is in the "code" folder
- **/code/Signal_generator.m**:  M. file to create voltage signals  with sampling frequency of 16 Khz/ 8Khz for further use with the python libraries **( Please Run this M file first)**
- **main _Code.ipynb**: the main file for usage
- **Pictures**:  code for Confusion Matrix & Train loss/ accuracy plot

## Intrudoction
With the ever-increasing usage of eco-friendly energy sources such as wind and solar, electric vehicles (EVs), and energy storage in our everyday lives, the significance of power quality (PQ) in power systems cannot be denied. The prevalence of power Electronic equipment in such devices, which brings various Power quality disturbances (PQDs), drives the power system toward new issues in PQ mitigation. Generally, These disturbances can lead to non-stationary waveforms that can prompt a range of issues, including delicate power-equipment failure, damage, and safety switches being accidentally activated. Detecting and classifying these disturbances is crucial in order to minimize damage and generate appropriate control actions for rectification. 

The classification of PQDs can be achieved through different approaches. These approaches include model-based methods, signal processing-based methods, and data-driven methods. The first two methods rely on mathematical modeling and expert knowledge, which are prone to error in the presence of noise and highly disturbed signals. The third method relies on the abilities of AI models, such as machine learning and deep learning, to recognize PQDs based on extracted features. Despite all the innovations and great performance of AI methods, they still have one major drawback, which is that these methods require a significant amount of data to perform well. This is challenging, especially in real industry problems. On the other, a lack of data may cause underfitting. Thus, in this study, inspired by the ability of transfer learning (TL) methods to perform well in the presence of a small dataset, a novel approach to recognize PQDs in the presence of Noise using WT and TL is proposed.  

As shown in Fig. 1, first, the TL model, EfficientNetV2B0, is trained in the source domain. Secondly, its top layer, which is responsible for classification in source target, is removed as we don’t need it. Finally, other layers are frozen to be used in the target domain. This procedure simply helps us benefit all the trained weights. In the target domain, two new fully connected layers with 14 and 29 neurons are added at the end of the frozen TL model to perform the PQD classification task. Furthermore, the TL model expects inputs with the size of 3*224*224, a.k.a colored image; therefore, a convolutional layer is added at the beginning of the TL model to convert one-channel gray-scale image to three-channel images. 

![Picture3](https://github.com/mahdiemad/High-Accuracy-Transfer-Learning-Based-Power-Quality-Disturbance-Recognition-Under-Noisy-Environment/assets/57590076/35c38a52-aa16-41ac-bc31-6f104ac192df)
#### Fig. 1. Overview of the proposed PQD classifier based on deep transfer Learning

## acknowledgement
Finally, we would like to thank the authors of the paper "Integral mathematical model of power quality disturbances". Enthusiastic readers are encouraged to review  [the paper](https://ieeexplore.ieee.org/document/8378902) at IEEE Explore.
