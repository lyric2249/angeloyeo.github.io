clear; close all; clc;
my_color = lines(2);

%% MLE�� �� ����

figure('color','w','position',[680, 588, 700, 400]);
line([-1 30],[0, 0],'color','k')
set(gca,'visible','off')
ylim([-0.05, 0.25])
mArrow2(-1,0,31,0,{'color','k'});

data = [1,4,5,6,9];
hold on;
plot(data, zeros(1,5), 'o','markerfacecolor',[0.85, 0.32, 0.098],'markeredgecolor', lines(1),'markersize',10)

for i = 1:length(data)
    text(data(i)-0.2, -0.02, num2str(data(i)),'fontsize',13);
end

text(32, -0.01, '$$x$$','Interpreter','latex','fontsize',13);

data = [-1,1,4,6,9]+20;
hold on;
plot(data, zeros(1,5), 'o','markerfacecolor',[0, 0.447, 0.741],'markeredgecolor', lines(1),'markersize',10)

for i = 1:length(data)
    text(data(i)-0.2, -0.02, num2str(data(i)),'fontsize',13);
end

xlim([-2, 32])

%% MLE�� �� ����

figure('color','w','position',[680, 588, 700, 400]);
line([-1 30],[0, 0],'color','k')
set(gca,'visible','off')
ylim([-0.05, 0.25])
mArrow2(-1,0,31,0,{'color','k'});

data = [1,4,5,6,9];
hold on;
plot(data, zeros(1,5), 'o','markerfacecolor',[0.85, 0.32, 0.098],'markeredgecolor', lines(1),'markersize',10)

for i = 1:length(data)
    text(data(i)-0.2, -0.02, num2str(data(i)),'fontsize',13);
end

text(32, -0.01, '$$x$$','Interpreter','latex','fontsize',13);

pd = fitdist(data', 'Normal');
xx = linspace(-3, 13, 100);
yy = pdf(pd,xx);
plot(xx, yy,'linewidth',3)

data = [-1,1,4,6,9]+20;
hold on;
plot(data, zeros(1,5), 'o','markerfacecolor',[0, 0.447, 0.741],'markeredgecolor', lines(1),'markersize',10)

for i = 1:length(data)
    text(data(i)-0.2, -0.02, num2str(data(i)),'fontsize',13);
end

pd2 = fitdist(data', 'Normal');
xx2 = linspace(12, 32, 100);
yy2 = pdf(pd2,xx2);
plot(xx2, yy2,'linewidth',3,'color',lines(1))
xlim([-2, 32])

%% label�� �־������� ���� ���

figure('color','w','position',[680, 588, 700, 400]);
line([-1 30],[0, 0],'color','k')
set(gca,'visible','off')
ylim([-0.05, 0.25])
mArrow2(-1,0,31,0,{'color','k'});

data1 = [1,4,5,6,9];
data2 = [19, 21, 24, 26, 29];

data = [data1, data2];

hold on;
plot(data, zeros(1,length(data)), 'o','markerfacecolor',[1,1,1],'markeredgecolor', [0, 0, 0], 'markersize',10)

for i = 1:length(data)
    text(data(i)-0.2, -0.02, num2str(data(i)),'fontsize',13);
end

text(32, -0.01, '$$x$$','Interpreter','latex','fontsize',13);

xlim([-2, 32])

my_gaussian = @(x, mu, sigma) 1/(sigma*sqrt(2*pi))*exp(-1*(x-mu).^2./(2 * sigma^2));

% ������� ... �����ϰ� mu ���� �����ص� ��츦 ������ �׸� �׸� ��.
% �׸��� �� �����͵鿡 ���� likelihood ���Ͽ� label �־��� ��.
xx = linspace(-5, 32, 100);
yy1 = my_gaussian(xx, 3, std(data1));
yy2 = my_gaussian(xx, 10, std(data2));
plot(xx, yy1,'linewidth',3,'color',my_color(2,:))
plot(xx, yy2,'linewidth',3,'color',my_color(1,:))
plot(data, zeros(1,length(data)), 'o','markerfacecolor',[1,1,1],'markeredgecolor', [0, 0, 0], 'markersize',10)


%% label�� �־������� ���� ���

figure('color','w','position',[680, 588, 700, 400]);
line([-1 30],[0, 0],'color','k')
set(gca,'visible','off')
ylim([-0.05, 0.25])
mArrow2(-1,0,31,0,{'color','k'});

data1 = [1,4,5,6,9];
data2 = [19, 21, 24, 26, 29];

data = [data1, data2];

hold on;
plot(data, zeros(1,length(data)), 'o','markerfacecolor',[1,1,1],'markeredgecolor', [0, 0, 0], 'markersize',10)

for i = 1:length(data)
    text(data(i)-0.2, -0.02, num2str(data(i)),'fontsize',13);
end

text(32, -0.01, '$$x$$','Interpreter','latex','fontsize',13);

xlim([-2, 32])

my_gaussian = @(x, mu, sigma) 1/(sigma*sqrt(2*pi))*exp(-1*(x-mu).^2./(2 * sigma^2));

% ������� ... �����ϰ� mu ���� �����ص� ��츦 ������ �׸� �׸� ��.
% �׸��� �� �����͵鿡 ���� likelihood ���Ͽ� label �־��� ��.
xx = linspace(-5, 32, 100);
yy1 = my_gaussian(xx, 3, std(data1));
yy2 = my_gaussian(xx, 10, std(data2));
plot(xx, yy1,'linewidth',3,'color',my_color(2,:))
plot(xx, yy2,'linewidth',3,'color',my_color(1,:))

line([9, 9],[0, my_gaussian(9, 3, std(data1))],'color','k','linestyle','--')
line([9, 9],[0, my_gaussian(9, 10, std(data2))],'color','k','linestyle','--')
line([-2, 9],my_gaussian(9, 3, std(data1))*[1, 1],'color','k','linestyle','--')
line([9, 32],my_gaussian(9, 10, std(data2))*[1, 1],'color','k','linestyle','--')
plot(9, my_gaussian(9, 3, std(data1)),'o','markerfacecolor','r','markeredgecolor','k')
plot(9, my_gaussian(9, 10, std(data2)),'o','markerfacecolor','r','markeredgecolor','k')
plot(data, zeros(1,length(data)), 'o','markerfacecolor',[1,1,1],'markeredgecolor', [0, 0, 0], 'markersize',10)

%% ���� ������ ���� ���ο� label�� ȹ��

figure('color','w','position',[680, 588, 700, 400]);
line([-1 30],[0, 0],'color','k')
hold on;
set(gca,'visible','off')
ylim([-0.05, 0.25])
mArrow2(-1,0,31,0,{'color','k'});

data1 = [1,4,5,6,9];
data2 = [19, 21, 24, 26, 29];

data = [data1, data2];
new_label = zeros(1, length(data));

for i_data = 1:length(data)
    x = data(i_data);
    y1 = my_gaussian(x, 3, std(data1));
    y2 = my_gaussian(x, 10, std(data2));
    
    new_label(i_data) = y2>y1;
    
    if y2>y1
        plot(x, 0, 'o','markerfacecolor',my_color(1,:),'markeredgecolor', [0, 0, 0], 'markersize',10)
    else
        plot(x, 0, 'o','markerfacecolor',my_color(2,:),'markeredgecolor', [0, 0, 0], 'markersize',10)
    end
    
end

for i = 1:length(data)
    text(data(i)-0.2, -0.02, num2str(data(i)),'fontsize',13);
end


%% label�� �־������� ���� ���

figure('color','w','position',[680, 588, 700, 400]);
line([-1 30],[0, 0],'color','k')
set(gca,'visible','off')
ylim([-0.05, 0.25])
mArrow2(-1,0,31,0,{'color','k'});

data1 = [1,4,5,6,9];
data2 = [19, 21, 24, 26, 29];

data = [data1, data2];

hold on;
plot(data, zeros(1,length(data)), 'o','markerfacecolor',[1,1,1],'markeredgecolor', [0, 0, 0], 'markersize',10)

for i = 1:length(data)
    text(data(i)-0.2, -0.02, num2str(data(i)),'fontsize',13);
end

text(32, -0.01, '$$x$$','Interpreter','latex','fontsize',13);

xlim([-2, 32])

idx0 = new_label == 0;
idx1 = new_label == 1;
% ������� ... �����ϰ� mu ���� �����ص� ��츦 ������ �׸� �׸� ��.
% �׸��� �� �����͵鿡 ���� likelihood ���Ͽ� label �־��� ��.
xx = linspace(-5, 32, 100);
yy1 = my_gaussian(xx, mean(data(idx0)), std(data(idx0)));
yy2 = my_gaussian(xx, mean(data(idx1)), std(data(idx1)));
plot(xx, yy1,'linewidth',3,'color',my_color(2,:))
plot(xx, yy2,'linewidth',3,'color',my_color(1,:))

plot(data, zeros(1,length(data)), 'o','markerfacecolor',[1,1,1],'markeredgecolor', [0, 0, 0], 'markersize',10)

    
%% Make Synthetic Data
rng(1)
mu = [0, 15];
vars = [12, 3];
n_data = 1000;
phi = [0.7, 0.3];
X = [];
for i_data = 1:n_data
    if rand(1) < 0.7
        X(end+1) = randn(1) * sqrt(vars(1)) + mu(1);
    else
        X(end+1) = randn(1) * sqrt(vars(2)) + mu(2);
    end
end

figure('position',[628, 334, 774, 577],'color','w'); 
histogram(X, 50,'Normalization','pdf')

xx = linspace(-30, 30, 100);
yy1 = normpdf(xx, mu(1), sqrt(vars(1)));
yy2 = normpdf(xx, mu(2), sqrt(vars(2)));

hold on;
grid on;
plot(xx, yy1 * phi(1)+ yy2 * phi(2), 'k','linewidth',2); % ��, phi = [0.7, 0.3]
xlabel('x');
ylabel('pdf');

%% GMM
% Video Settings

newVid = VideoWriter('pic1', 'MPEG-4'); % New
newVid.FrameRate = 20;
newVid.Quality = 100;
open(newVid);


%
clear h
my_normal = @(x, mu, sigma) 1/(sigma * sqrt(2*pi)).*exp(-1 * (x-mu).^2/(2*sigma^2));
% random initialization
est_mu = [-25, 20];
est_vars = [7, 9.5];

est_w = zeros(n_data, 2);
est_phi = [0.5, 0.5];

est_yy1 = normpdf(xx, est_mu(1), sqrt(est_vars(1)));
est_yy2 = normpdf(xx, est_mu(2), sqrt(est_vars(2)));


h1 = plot(xx, est_yy1 * est_phi(1), 'r','linewidth',4);
h2 = plot(xx, est_yy2 * est_phi(2), 'g','linewidth',4);
t = text(-27, 0.075, 'the first initialization','fontsize',12);

for i = 1:15 % ù��� 750 ms ���
    writeVideo(newVid, getframe(gcf))
end

delete(t);
delete(h1);
delete(h2);

% GMM iteration
n_iter = 50;
for i_iter = 1:n_iter
    
    for i_data = 1:n_data
        l1 = my_normal(X(i_data), est_mu(1), sqrt(est_vars(1)));
        l2 = my_normal(X(i_data), est_mu(2), sqrt(est_vars(2)));
        
        est_w(i_data, 1) = (l1 * est_phi(1)) / (l1 * est_phi(1) + l2 * est_phi(2));
        est_w(i_data, 2) = (l2 * est_phi(2)) / (l1 * est_phi(1) + l2 * est_phi(2));
    end
    
    est_phi = 1/n_data * sum(est_w, 1);
    est_mu(1) = (X * est_w(:,1))/sum(est_w(:,1));
    est_mu(2) = (X * est_w(:,2))/sum(est_w(:,2));
    
    est_vars(1) = sum(est_w(:,1)'.*(X-est_mu(1)).^2)/sum(est_w(:,1));
    est_vars(2) = sum(est_w(:,2)'.*(X-est_mu(2)).^2)/sum(est_w(:,2));
    
    est_yy1 = normpdf(xx, est_mu(1), sqrt(est_vars(1)));
    est_yy2 = normpdf(xx, est_mu(2), sqrt(est_vars(2)));
    
    h1 = plot(xx, est_yy1 * est_phi(1), 'r','linewidth',4);
    h2 = plot(xx, est_yy2 * est_phi(2), 'g','linewidth',4);
    t = text(-27, 0.075,  ['Epoch: ',num2str(i_iter),' / ',num2str(n_iter)],'fontsize',12);
%     pause;

    writeVideo(newVid, getframe(gcf))
    drawnow;
    if i_iter < n_iter
        delete(t);
        delete(h1);
        delete(h2);
    end
    
    
end

for i = 1:30 % ������ ��鿡�� 1.5�� �� ����� �� �ֵ���
    writeVideo(newVid, getframe(gcf))
end

close(newVid)