% Gráficas

% plot(vec_coste(1,:),'b');hold on;plot(vec_coste(2,:),'r');plot(vec_coste(3,:),'y');plot(vec_coste(4,:),'g');plot(vec_coste(5,:),'m');plot(vec_coste(6,:),'k');grid on
% 
% figure
% 
% plot(vec_excesos(1,:),'r');hold on;plot(vec_precio(1,:),'y');plot(vec_coste(1,:),'b');plot(find(vec_coste(1,:)==min(vec_coste(1,:))),min(vec_coste(1,:)),'o');yline(min(vec_coste(1,:)),'--')
% figure
% plot(vec_excesos(2,:),'r');hold on;plot(vec_precio(2,:),'y');plot(vec_coste(2,:),'b');plot(find(vec_coste(2,:)==min(vec_coste(2,:))),min(vec_coste(2,:)),'o');yline(min(vec_coste(2,:)),'--')
% figure
% plot(vec_excesos(3,:),'r');hold on;plot(vec_precio(3,:),'y');plot(vec_coste(3,:),'b');plot(find(vec_coste(3,:)==min(vec_coste(3,:))),min(vec_coste(3,:)),'o');yline(min(vec_coste(3,:)),'--')
% figure
% plot(vec_excesos(4,:),'r');hold on;plot(vec_precio(4,:),'y');plot(vec_coste(4,:),'b');plot(find(vec_coste(4,:)==min(vec_coste(4,:))),min(vec_coste(4,:)),'o');yline(min(vec_coste(4,:)),'--')
% figure
% plot(vec_excesos(5,:),'r');hold on;plot(vec_precio(5,:),'y');plot(vec_coste(5,:),'b');plot(find(vec_coste(5,:)==min(vec_coste(5,:))),min(vec_coste(5,:)),'o');yline(min(vec_coste(5,:)),'--')
% figure
% plot(vec_excesos(6,:),'r');hold on;plot(vec_precio(6,:),'y');plot(vec_coste(6,:),'b');plot(find(vec_coste(6,:)==min(vec_coste(6,:))),min(vec_coste(6,:)),'o');yline(min(vec_coste(6,:)),'--')

% Gráficas de como influye los excesos y precios de cada periodo
% individualente, marcando sus mínimos, es decir, cual sería la potencia
% contratada ideal teniendo en cuenta cada periodo por separado

%- Potencias óptimas individuales
for i=1:6
    minimo(i)=find(vec_coste(i,:)==min(vec_coste(i,:)));
end
