#import "templates/modern.typ": render as render-modern
#import "templates/ats.typ": render as render-ats

#let data = yaml("data/cv.yaml")

#let template = sys.inputs.at("template", default: "modern")
#let language = sys.inputs.at("lang", default: "en")

#if template == "modern" {
  render-modern(data, language)
} else if template == "ats" {
  render-ats(data, language)
}
