# ~/nixy-sonako/modules/git.nix
{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    ignores = [
      "result"          
      ".direnv"         
      "*.swp"           
      ".DS_Store"       
      "node_modules"    
    ];

    settings = {
      user= {
        name = "Yosaki-sonako";         
        email = "yosakisonako@gmail.com"; 
      };
      
      core = {
        editor = "nvim";
      };

      credential = {
        helper = "${pkgs.gh}/bin/gh auth git-credential";
      };

      iniit = {
        defaultBranch = "main";
      };
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true; 
    options = {
      navigate = true;
      light = false;
      side-by-side = true;       
      line-numbers = true;      
      };
  };

  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "https"; 
    };
  };
}

