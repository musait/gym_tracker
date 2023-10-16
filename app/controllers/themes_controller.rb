class ThemesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_theme, only: [:show, :edit, :update, :destroy]

  # Affiche tous les thèmes
  def index
    @themes = current_user.themes
  end

  # Affiche un thème spécifique
  def show
  end

  # Initialise un nouveau thème pour le formulaire de création
  def new
    @theme = Theme.new
  end

  # Crée un nouveau thème en fonction des paramètres soumis
  def create
    @theme = Theme.new(theme_params)
    if @theme.save
      redirect_to @theme, notice: 'Le thème a été créé avec succès.'
    else
      render :new
    end
  end

  # Affiche le formulaire d'édition pour un thème spécifique
  def edit
  end

  # Met à jour un thème spécifique en fonction des paramètres soumis
  def update
    if @theme.update(theme_params)
      redirect_to @theme, notice: 'Le thème a été mis à jour avec succès.'
    else
      render :edit
    end
  end

  # Supprime un thème spécifique
  def destroy
    @theme.destroy
    redirect_to themes_url, notice: 'Le thème a été supprimé avec succès.'
  end

  private

  # Récupère le thème basé sur l'ID du paramètre
  def set_theme
    @theme = current_user.themes.find(params[:id])
  end

  # Autorise seulement les paramètres sécurisés à être soumis
  def theme_params
    params.require(:theme).permit(:name, :description)
  end
end
