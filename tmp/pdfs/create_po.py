from pathlib import Path
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib import colors
from reportlab.lib.enums import TA_RIGHT
from reportlab.lib.pagesizes import A4
import pypdfium2 as pdfium
from pypdf import PdfReader

out=Path('output/pdf/Protenex_Purchase_Order_QiLink_20260915.pdf')
out.parent.mkdir(parents=True, exist_ok=True)
styles=getSampleStyleSheet()
styles.add(ParagraphStyle(name='BodyPO',fontName='Helvetica',fontSize=9,leading=12,spaceAfter=3))
styles.add(ParagraphStyle(name='SmallPO',fontName='Helvetica',fontSize=8,leading=10.5))
styles.add(ParagraphStyle(name='SectionPO',fontName='Helvetica-Bold',fontSize=9,leading=12,textColor=colors.HexColor('#17364A'),spaceBefore=10,spaceAfter=5))
styles.add(ParagraphStyle(name='TitlePO',fontName='Helvetica-Bold',fontSize=23,leading=27,textColor=colors.HexColor('#17364A')))
def p(t,style='BodyPO'): return Paragraph(t,styles[style])
def section(t): return p(t,'SectionPO')
story=[p('PURCHASE ORDER','TitlePO'),Spacer(1,6),p('<b>PROTENEX GOODS WHOLE SALERS LLC</b>'),Spacer(1,7)]
meta=Table([[p('<b>PO No.</b> PTX-PO-20260915-001'),p('<b>Date:</b> 15 September 2026')]],colWidths=[310,205])
meta.setStyle(TableStyle([('BACKGROUND',(0,0),(-1,-1),colors.HexColor('#EDF2F5')),('TOPPADDING',(0,0),(-1,-1),8),('BOTTOMPADDING',(0,0),(-1,-1),6)]))
story += [meta,Spacer(1,10)]
parties=Table([[p('<b>BUYER / BILL TO</b>','SectionPO'),p('<b>SUPPLIER / OEM</b>','SectionPO')],[p('<b>Protenex Goods Whole Salers LLC</b><br/>Billing address: To be advised'),p("<b>QiLink Technologies Limited</b><br/>Flat 3B, 3/F, Bank Tower, Nos. 351 &amp; 353 King's Road,<br/>North Point, Hong Kong, China<br/>Tel: +8613554138543<br/>Attention: Lucy Zhang")]],colWidths=[235,280])
parties.setStyle(TableStyle([('VALIGN',(0,0),(-1,-1),'TOP'),('LEFTPADDING',(0,0),(-1,-1),0),('BOTTOMPADDING',(0,0),(-1,-1),3)]))
story += [parties,Spacer(1,5),p('<b>Quotation reference:</b> Development Board quotation dated 11 September 2026 (source file: 1-Quotation for Development Board-20260914.pdf).','SmallPO'),section('ORDER DETAILS'),p('Please supply the following goods in accordance with the referenced quotation and the terms below.')]
rows=[[p('<b>No.</b>','SmallPO'),p('<b>Description</b>','SmallPO'),p('<b>Unit</b>','SmallPO'),p('<b>Qty</b>','SmallPO'),p('<b>Unit price<br/>USD</b>','SmallPO'),p('<b>Amount<br/>USD</b>','SmallPO')],[p('1'),p('<b>Automotive wireless circuit development board</b><br/>Each kit contains a circuit development board, two antennas, and the corresponding connecting cables. Power adapter is not included.'),p('set'),p('23'),p('103.00'),p('2,369.00')]]
t=Table(rows,colWidths=[28,258,35,32,78,84])
t.setStyle(TableStyle([('BACKGROUND',(0,0),(-1,0),colors.HexColor('#EDF2F5')),('GRID',(0,0),(-1,-1),0.5,colors.HexColor('#C6D0D7')),('VALIGN',(0,0),(-1,-1),'TOP'),('TOPPADDING',(0,0),(-1,-1),7),('BOTTOMPADDING',(0,0),(-1,-1),7)]))
story += [t,Spacer(1,7),p('<b>TOTAL PURCHASE ORDER VALUE: USD 2,369.00</b>'),p('US Dollars Two Thousand Three Hundred and Sixty-Nine Only.','SmallPO'),section('COMMERCIAL AND DELIVERY TERMS')]
terms=[('Payment','100% payment before shipment.'),('Shipment / trade term','By Air; FOB Wuhan (as quoted).'),('Origin / route','China; from Wuhan, China to Karachi, Pakistan.'),('Delivery address / schedule','Full delivery address and shipment date: To be advised.'),('Charges','No separate freight, tax, duty, or other charge is itemized in the quotation.'),('Supplier clarification','Quotation specifies "By Air" but labels the total "Total Price by Sea". Supplier to confirm the shipping basis before shipment.')]
def kv(rows,width=112):
    t=Table([[p('<b>'+k+'</b>','SmallPO'),p(v,'SmallPO')] for k,v in rows],colWidths=[width,515-width])
    t.setStyle(TableStyle([('VALIGN',(0,0),(-1,-1),'TOP'),('LEFTPADDING',(0,0),(-1,-1),0),('TOPPADDING',(0,0),(-1,-1),2),('BOTTOMPADDING',(0,0),(-1,-1),3)]))
    return t
story += [kv(terms),section('BENEFICIARY AND BANK DETAILS'),kv([('Beneficiary / account name','QiLink Technologies Limited'),('Account number','200000000528505'),('Bank','JPMorgan Chase Bank N.A., Hong Kong Branch'),('Country / region','Hong Kong'),('Bank address','16/F Tower 2 The Quayside, 77 Hoi Bun Road, Kwun Tong, Hong Kong'),('SWIFT code','CHASHKHH (CHASHKHHXXX if 11 characters are required)'),('Bank / branch code','007 / 863'),('Clearing system','SWIFT, RTGS')]),Spacer(1,12),p('<b>For Protenex Goods Whole Salers LLC</b>'),Spacer(1,13),p('Authorized signature / company stamp: ____________________    Date: ______________','SmallPO')]
def footer(c,d):
    c.setStrokeColor(colors.HexColor('#C6D0D7'));c.line(40,37,555,37)
    c.setFont('Helvetica',7);c.setFillColor(colors.HexColor('#536572'));c.drawString(40,25,'PTX-PO-20260915-001  |  Protenex Goods Whole Salers LLC');c.drawRightString(555,25,f'Page {d.page}')
doc=SimpleDocTemplate(str(out),pagesize=A4,rightMargin=40,leftMargin=40,topMargin=30,bottomMargin=47,title='Purchase Order - Protenex Goods Whole Salers LLC to QiLink Technologies Limited',author='Protenex Goods Whole Salers LLC')
doc.build(story,onFirstPage=footer,onLaterPages=footer)
r=PdfReader(out)
assert len(r.pages)==1, len(r.pages)
text=''.join(page.extract_text() for page in r.pages)
for value in ['200000000528505','2,369.00','CHASHKHH','23','103.00']:
    assert value in text,value
assert 23*103==2369
pdf=pdfium.PdfDocument(str(out));pdf[0].render(scale=1.6).to_pil().save('tmp/pdfs/po-preview.png')
print(out.resolve())
