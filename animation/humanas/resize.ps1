# Path to the directory containing the images
$sourceDirectory = "C:\Users\Fuvest\Documents\GitHub\carreiras\public\animation\biologicas_2x"

# Get all files with .jpg extension in the source directory
$imageFiles = Get-ChildItem -Path $sourceDirectory -Filter *.jpg

foreach ($file in $imageFiles) {
    # Construct the output filename with .png extension
    $outputFileName = [System.IO.Path]::ChangeExtension($file.FullName, "jpg")
    
    # Convert the image using ImageMagick (assuming it's installed and in PATH)
    & magick $file.FullName -resize 256x256 -quality 100 $outputFileName
    
    Write-Host "Converted $($file.Name)."
}
