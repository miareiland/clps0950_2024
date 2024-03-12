% Create a figure
figure;

% Define rectangle dimensions
rect_width = 50;
rect_height = 75;

global wKeyPressed sKeyPressed upArrowPressed downArrowPressed;

paddlewidth = 0.015
paddleheight = 0.15

% Player 1 Paddle 
paddleA_position = [0, 0.5 - (paddleheight/2), paddlewidth, paddleheight]
% Player 2 Paddle 
paddleB_position = [1 - paddlewidth, 0.5 - (paddleheight/2), paddlewidth, paddleheight]

% Set up KeyPressFcn/KeyReleaseFcn callback function
set(gcf, 'KeyPressFcn', @keyDown);
set(gcf, 'KeyReleaseFcn', @keyUp);

% variables for key press 
upArrowPressed = false; 
downArrowPressed = false; 
wKeyPressed = false; 
sKeyPressed = false;

% callback for key press 
    % Callback function for key press
    function keyDown(~, event)
        switch event.Key
            case 'uparrow'
                upArrowPressed = true;
            case 'downarrow'
                downArrowPressed = true;
            case 'w'
                wKeyPressed = true;
            case 's'
                sKeyPressed = true;
        end
    end

    % Callback function for key release
    function keyUp(~, event)
        switch event.Key
            case 'uparrow'
                upArrowPressed = false;
            case 'downarrow'
                downArrowPressed = false;
            case 'w'
                wKeyPressed = false;
            case 's'
                sKeyPressed = false;
        end
    end
    % Updating movement — updated by storing code inside infinite loop 
    
    while true 
        if wKeyPressed
            paddleA_position.Position(2) = paddleA_position.Position(2) + 0.01; 
        elseif sKeyPressed
            paddleA_position.Position(2) = paddleA_position.Position(2) - 0.01; 
        end 

        if downArrowPressed
            paddleB_position.Position(2) = paddleB_position.Position(2) - 0.01;
        elseif upArrowPressed
            paddleB_position.Position(2) = paddleB_position.Position(2) + 0.01; 
        end
        pause(0.01); 
    end 
