using System;
using System.Collections.Generic;
using System.IO;
using System.Windows;

namespace Music
{
    public partial class MainWindow : Window
    {
        private List<Album> albums = new List<Album>();
        private int currentIndex;

        public MainWindow()
        {
            InitializeComponent();
            LoadData();
            DisplayAlbum(0);
        }

        private void LoadData()
        {
            string filePath = "Data1.txt";
            if (!File.Exists(filePath))
            {
                MessageBox.Show($"Nie znaleziono pliku: {filePath}", "Błąd", MessageBoxButton.OK, MessageBoxImage.Error);
                Application.Current.Shutdown();
            }

            var lines = File.ReadAllLines(filePath);

            for (int i = 0; i < lines.Length; i += 5)
            {
                if (i + 4 < lines.Length)
                {
                    try
                    {
                        var artist = lines[i].Trim();
                        var title = lines[i + 1].Trim().Trim('"'); // Usuwanie " wokół tytułu
                        var tracks = int.Parse(lines[i + 2].Trim());
                        var year = int.Parse(lines[i + 3].Trim());
                        var downloads = int.Parse(lines[i + 4].Trim());

                        albums.Add(new Album
                        {
                            Artist = artist,
                            Title = title,
                            Tracks = tracks,
                            Year = year,
                            Downloads = downloads
                        });
                    }
                    catch (FormatException ex)
                    {
                        Console.WriteLine($"Błąd formatu danych. Szczegóły: {ex.Message}");
                    }
                }
                else
                {
                    Console.WriteLine($"Niepełny blok danych zaczynający się od linii {i + 1}");
                }
            }

            if (albums.Count == 0)
            {
                MessageBox.Show("Brak poprawnych danych w pliku.", "Błąd", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }




        private void DisplayAlbum(int index)
        {
            if (albums.Count == 0)
                return;

            currentIndex = index;
            var album = albums[currentIndex];

            Artist.Text = $"Wykonawca: {album.Artist}";
            Album.Text = $"Album: {album.Title}";
            Tracks.Text = $"Liczba utworów: {album.Tracks}";
            Year.Text = $"Rok wydania: {album.Year}";
            Downloads.Text = $"Pobrań: {album.Downloads}";
        }

        private void PreviousButton_Click(object sender, RoutedEventArgs e)
        {
            int newIndex = (currentIndex == 0) ? albums.Count - 1 : currentIndex - 1;
            DisplayAlbum(newIndex);
        }

        private void NextButton_Click(object sender, RoutedEventArgs e)
        {
            int newIndex = (currentIndex == albums.Count - 1) ? 0 : currentIndex + 1;
            DisplayAlbum(newIndex);
        }

        private void DownloadButton_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Pobieranie rozpoczęte!", "Informacja", MessageBoxButton.OK, MessageBoxImage.Information);
        }
    }

    public class Album
    {
        public string Artist { get; set; }
        public string Title { get; set; }
        public int Tracks { get; set; }
        public int Year { get; set; }
        public int Downloads { get; set; }
    }
}
