# Calculadora IMC
Aplicativo desenvolvido em Flutter para calcular o Índice de Massa Corporal (IMC) e exibir a respectiva categoria com base nas informações de peso e altura fornecidas. 

## Funcionalidades Implementadas
Implementei uma tratativa de erro utilizando **try-catch** e o **AlertDialog** para emitir um alerta sobre valores inseridos de maneira incorreta. Além disso, incluí uma validação para que o botão "Calcular IMC" só esteja disponível após o preenchimento dos campos peso e altura, utilizando o **ValueNotifier** e o **ValueListenableBuilder**.

### Gerencimento de estado utilizado
- ValueNotifier

### Arquitetura adotada
- MVC

### Como utilizar
1. Insira o peso e altura nos campos fornecidos.
2. Pressione o botão "Calcular IMC".
3. Visualize o índice de massa corporal e a categoria correspondente.

### Demonstração
<img src="https://github.com/devnatanaelsantos/assets/blob/main/app_imc/gif.gif" width=300 height='650'>

### Layout

<div style="display: flex; justify-content: space-between;">
<img src="https://github.com/devnatanaelsantos/assets/blob/main/app_imc/1.png" width=300 height='650'>
<img src="https://github.com/devnatanaelsantos/assets/blob/main/app_imc/2.png" width=300 height='650'>
<img src="https://github.com/devnatanaelsantos/assets/blob/main/app_imc/3.png" width=300 height='650'>
</div>

