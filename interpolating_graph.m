function interpolating_graph(x,y,data_points_x,data_points_y,y_interpolate)
%plot graph
%x,y are array values of the original sin curve
%y_interpolate is the interpolated y values based on the function
%data_points_x, y_data is the data points
name_variable = inputname(5);
color = rand(1,3);
figure;
for i = 1:length(data_points_x)
    ax(i) = subplot(2,3,i);
    plot(x,y,'k-')
    hold(ax(i),'on');
    plot(data_points_x{i},data_points_y{i},'kx',"MarkerSize",2)
    hold(ax(i),'on');
    plot(x, y_interpolate{1,i},'g--','color',color)
    title(sprintf('%d data points',length(data_points_x{i})),'FontSize',20)
    ylabel('f(x)','FontSize',16)
    xlabel('x','FontSize',16)
    ylim([-1.5 1.5])
    legend({'original','data points',name_variable},'Location','southwest','Interpreter', 'none','FontSize',16)
    legend('boxoff')
end

for i = 1:length(data_points_x)
    ax(i) = subplot(2,3,i+3);   
    plot(x,y-y_interpolate{1,i},'k-')
    ylabel(['sin(x) - ', name_variable],'Interpreter', 'none','FontSize',16)
    xlabel('x','FontSize',16)
    xL=xlim;
    yL=ylim;
    title(sprintf('%d data points',length(data_points_x{i})),'FontSize',20)
    rmse_error = sqrt(sum((y-y_interpolate{1,i}).^2)/length(x));
    txt = ['RMSE error = ',num2str(rmse_error,3)];
    text(0.30*xL(2),0.75*yL(2),0,txt,'FontSize',16)
end

end

