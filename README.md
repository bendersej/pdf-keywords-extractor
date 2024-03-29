# 🤖 PDF Keywords Extractor 🤖

## What is it?

An automation that automatically identifies whether the given PDFs contain the specified keywords, outputting the result as a CSV file.

---

![Runa Sandvik's Tweet](https://cdn.simplepdf.eu/pdf-keywords-extractor/runa_sandvik_tweet.png)

_[Source](https://twitter.com/runasand/status/1510246476315865095?s=28&t=OuZRixtNy4qzC6T2xdFr0Q)_

---

## Show Me!

https://user-images.githubusercontent.com/10613140/161422053-14d1a21a-1018-47d2-aeed-79e702d0eff6.mp4

# How to use the PDF Keywords Extractor

## Via User-Interface (for technical and non-technical users)

_Prerequisites_:

- [A Robocorp account](https://robocorp.com) – necessary to download the assistant, **available under the free plan without needing to provide a credit card**
- [Robocorp Assistant](https://robocorp.com/docs/control-room/configuring-assistants/installation)

Once downloaded and installed, click on _Install a community assistant_ and paste in the URL of this repository: `https://github.com/bendersej/pdf-keywords-extractor`.

## Via Command-Line (for technical users)

_Prerequisite_:

- [RCC](https://github.com/robocorp/rcc)

Place yourself at the root of this folder and run the following command:

```bash
rcc run
```

## Known issues

**Extracting the text from big PDFs files currently takes a significant amount of time.**

For example, it takes roughly 1 min and 10s to extract keywords for [The Count of Monte Cristo](http://msdl.cs.mcgill.ca/people/tfeng/books/The%20Count%20of%20Monte%20Cristo.pdf).

## Contributing

### Via Pull Request

Feel free to open a new pull request with your proposed feature.

### Via Issue

If you don't have the skills or the time, feel free to open an Issue describing the feature you would like to be implemented.
