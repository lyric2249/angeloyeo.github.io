clear; close all; clc;
% GMM video 만들기
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
plot(xx, yy1 * phi(1)+ yy2 * phi(2), 'k','linewidth',2); % 즉, phi = [0.7, 0.3]
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

for i = 1:15 % 첫장면 750 ms 대기
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

for i = 1:30 % 마지막 장면에서 1.5초 더 대기할 수 있도록
    writeVideo(newVid, getframe(gcf))
end

close(newVid)